import 'dart:async';

import 'package:ebuy/core/function/UiFunctions/SnackBars.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/model/CartModels/StaticAddressModel.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class AddressController extends GetxController {
  void goToUserLocation();
  void saveLocation();
  void handleAddressAdd(String val);
  void saveAddress();
  void chooseAddress(int index);
}

class AddressControllerimp extends AddressController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  late Completer<GoogleMapController> googleMapController;
  CameraPosition cameraPosition = const CameraPosition(target: LatLng(0, 0));
  late String choosenLocation;
  late List<Placemark> placemark;
  late TextEditingController adNameController;
  List<StaticAddressModel> addressList = [];
  List<AddressCartModel> addressCardList = [];
  int oldIndex = 0;
  bool canAddAddress = false;
  bool anyAddress = false;
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
  void saveLocation() async {
    try {
      List<Placemark> placemark = await placemarkFromCoordinates(
          cameraPosition.target.latitude, cameraPosition.target.longitude);
      if (placemark.isNotEmpty) {
        choosenLocation =
            placemark[0].street!.replaceAll("${placemark[0].postalCode}", '');
        Get.offNamed(AppRoutes.addAddressNamePageRoute);
      }
    } on Exception catch (_) {
      errorSnackBar('Something went wrong!',
          'it\'s maybe Because of slow internet connection or you have choosen wrong location');
    }
  }

  @override
  void handleAddressAdd(String val) {
    if (val.isEmpty) {
      canAddAddress = false;
    } else {
      canAddAddress = true;
    }
    update();
  }

  @override
  void saveAddress() {
    anyAddress = true;
    if (addressCardList.isEmpty) {
      addressCardList.add(
        AddressCartModel(title: adNameController.text, isSelected: true),
      );
    } else {
      addressCardList.add(
        AddressCartModel(title: adNameController.text, isSelected: false),
      );
    }

    addressList = [
      StaticAddressModel(
          title: authBox.get(HiveKeys.username), icon: Icons.person),
      StaticAddressModel(
          title: choosenLocation, icon: Icons.location_on_outlined),
      StaticAddressModel(title: "PhoneNumber", icon: Icons.amp_stories_rounded)
    ];
    Get.back();
    update();
    canAddAddress = false;
    adNameController.clear();
  }

  @override
  void chooseAddress(int index) {
    addressCardList[oldIndex].isSelected = false;
    addressCardList[index].isSelected = true;
    oldIndex = index;
    update();
  }

  @override
  void onInit() {
    googleMapController = Completer<GoogleMapController>();
    adNameController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    adNameController.dispose();
    super.onClose();
  }
}
