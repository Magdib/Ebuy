import 'dart:async';

import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/function/UiFunctions/SnackBars.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/core/function/handleHiveNullState.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/model/CartModels/StaticAddressModel.dart';
import 'package:ebuy/data/model/SettingsModels/AddressModel.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ebuy/data/dataSource/remote/home/AddressData.dart';

abstract class AddressController extends GetxController {
  getAddresses(bool showLoading);
  void goToUserLocation();
  void goToEditAddress(int index);
  void saveLocation();
  void handleAddressAdd();
  void saveAddress();
  void chooseAddress(int index);
  void removeAddress(int index);
  willPopAddress();
}

class AddressControllerimp extends AddressController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  late Completer<GoogleMapController> googleMapController;
  CameraPosition cameraPosition = const CameraPosition(target: LatLng(0, 0));
  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  StatusRequest addStatusRequest = StatusRequest.none;
  late String choosenLocation;
  late List<Placemark> placemark;
  late TextEditingController adNameController;
  late TextEditingController adNumberController;
  List<AddressCartModel> shippingAddresList = [];
  List<AddressModel> addressList = [];
  int? oldIndex;
  int? editIndex;
  bool canAddAddress = false;
  bool anyAddress = false;
  @override
  getAddresses(bool showLoading) async {
    if (showLoading == true) {
      statusRequest = StatusRequest.loading;
      update();
    }
    var response = await addressData.getAddresses(authBox.get(HiveKeys.userid));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List addressTempList = response['data'];
        addressList
            .addAll(addressTempList.map((e) => AddressModel.fromJson(e)));

        if (addressList.isNotEmpty) {
          anyAddress = true;
          for (int i = 0; i < addressList.length; i++) {
            if (i == authBox.get(HiveKeys.choosenAddress)) {
              shippingAddresList.add(AddressCartModel(
                  title: addressList[i].addressName!, isSelected: true));
            } else {
              shippingAddresList.add(AddressCartModel(
                  title: addressList[i].addressName!, isSelected: false));
            }
          }
        }
      }
    }
    update();
  }

  @override
  goToUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    if (!serviceEnabled) {
      errorSnackBar(
          'Error has occure', 'Please enable location service and try again');
    } else {
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      } else if (permission == LocationPermission.deniedForever) {
        errorSnackBar('Error has occure',
            'Location permissions are permanently denied, we cannot request permissions.');
      } else {
        Position userPosition;
        userPosition = await Geolocator.getCurrentPosition();
        LatLng userLocation =
            LatLng(userPosition.latitude, userPosition.longitude);
        cameraPosition = CameraPosition(target: userLocation, zoom: 18);
        final GoogleMapController controller = await googleMapController.future;
        await controller
            .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      }
    }
  }

  @override
  void goToEditAddress(int index) {
    editIndex = index;
    adNumberController.text = addressList[index].addressPhone!;
    adNameController.text = addressList[index].addressName!;
    canAddAddress = true;
    Get.toNamed(AppRoutes.addAddressMapPageRoute);
  }

  @override
  void saveLocation() async {
    try {
      placemark = await placemarkFromCoordinates(
          cameraPosition.target.latitude, cameraPosition.target.longitude);
      Get.offNamed(AppRoutes.addAddressNamePageRoute);
    } on Exception catch (_) {
      errorSnackBar('Something went wrong!',
          'it\'s maybe Because of slow internet connection or you have choosen wrong location');
    }
  }

  @override
  void handleAddressAdd() {
    if (adNameController.text.isEmpty || adNumberController.text.isEmpty) {
      canAddAddress = false;
    } else {
      canAddAddress = true;
    }
    update();
  }

  @override
  void saveAddress() async {
    addStatusRequest = StatusRequest.loading;
    update();
    if (editIndex == null) {
      if (anyAddress == false) {
        anyAddress = true;
      }
      var response = await addressData.addAddress(
          authBox.get(HiveKeys.userid),
          adNameController.text,
          adNumberController.text,
          placemark[0].locality!,
          placemark[0].street!,
          "${cameraPosition.target.latitude}",
          "${cameraPosition.target.longitude}");
      addStatusRequest = handlingData(response);
      if (addStatusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          if (shippingAddresList.isEmpty) {
            authBox.put(HiveKeys.choosenAddress, 0);
          }
          addressList.clear();
          shippingAddresList.clear();
          List addressTempList = response['data'];
          addressList
              .addAll(addressTempList.map((e) => AddressModel.fromJson(e)));
          for (int i = 0; i < addressList.length; i++) {
            if (i == authBox.get(HiveKeys.choosenAddress)) {
              shippingAddresList.add(AddressCartModel(
                  title: addressList[i].addressName!, isSelected: true));
            } else {
              shippingAddresList.add(AddressCartModel(
                  title: addressList[i].addressName!, isSelected: false));
            }
          }
          Get.back();
          succesSnackBar('Done.', 'Your address have been added successfully');
        } else {
          errorSnackBar('Something went wrong!',
              'it\'s maybe Because of slow internet connection');
        }
      }
    } else {
      var response = await addressData.editAddress(
          authBox.get(HiveKeys.userid),
          addressList[editIndex!].addressId!,
          adNameController.text,
          adNumberController.text,
          placemark[0].locality!,
          placemark[0].street!,
          "${cameraPosition.target.latitude}",
          "${cameraPosition.target.longitude}");
      addStatusRequest = handlingData(response);
      if (addStatusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          if (shippingAddresList.isEmpty) {
            authBox.put(HiveKeys.choosenAddress, 0);
          }
          addressList.clear();
          shippingAddresList.clear();
          List addressTempList = response['data'];
          addressList
              .addAll(addressTempList.map((e) => AddressModel.fromJson(e)));
          for (int i = 0; i < addressList.length; i++) {
            if (i == authBox.get(HiveKeys.choosenAddress)) {
              shippingAddresList.add(AddressCartModel(
                  title: addressList[i].addressName!, isSelected: true));
            } else {
              shippingAddresList.add(AddressCartModel(
                  title: addressList[i].addressName!, isSelected: false));
            }
          }
          Get.back();
          succesSnackBar('Done.', 'Your address have been edited successfully');
          editIndex = null;
        } else {
          errorSnackBar('Something went wrong!',
              'it\'s maybe Because of slow internet connection');
        }
      }
    }
    update();
    canAddAddress = false;
    adNameController.clear();
    adNumberController.clear();
  }

  @override
  void chooseAddress(int index) {
    shippingAddresList[oldIndex!].isSelected = false;
    authBox.put(HiveKeys.choosenAddress, index);
    shippingAddresList[index].isSelected = true;
    oldIndex = index;
    update();
  }

  @override
  void removeAddress(int index) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await addressData.removeAddress(addressList[index].addressId!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        addressList.removeAt(index);
        shippingAddresList.removeAt(index);
        if (shippingAddresList.isEmpty) {
          authBox.put(HiveKeys.choosenAddress, 0);
          anyAddress = false;
        } else {
          if (authBox.get(HiveKeys.choosenAddress) == index &&
              index == addressList.length) {
            authBox.put(HiveKeys.choosenAddress, 0);
            oldIndex = 0;
            shippingAddresList[0].isSelected = true;
          }
        }

        succesSnackBar('Done.', 'Your address have been deleted successfully');
      } else {
        errorSnackBar('Something went wrong!',
            'it\'s maybe Because of slow internet connection');
      }
    }
    update();
  }

  @override
  willPopAddress() {
    canAddAddress = false;
    addStatusRequest = StatusRequest.none;
    editIndex = null;
    Get.back();
    return Future.value(false);
  }

  @override
  void onInit() {
    googleMapController = Completer<GoogleMapController>();
    adNameController = TextEditingController();
    adNumberController = TextEditingController();
    getAddresses(false);
    oldIndex = handleHiveNullState(HiveKeys.choosenAddress, 0);
    super.onInit();
  }

  @override
  void onClose() {
    adNameController.dispose();
    adNumberController.dispose();
    super.onClose();
  }
}
