import 'package:ebuy/Controller/Home/SettingsControllers/AddressController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressMap extends GetView<AddressControllerimp> {
  const AddAddressMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.goToUserLocation(),
          child: const Icon(
            Icons.my_location_rounded,
            color: AppColors.white,
          ),
        ),
        appBar: AppBar(
            title: Text(
              'Address Location',
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: true,
            actions: [
              TextButton(
                  onPressed: () => controller.saveLocation(),
                  child: Text('Save',
                      style: Theme.of(context).textTheme.headline2))
            ]),
        body: WillPopScope(
          onWillPop: () => controller.willPopAddress(),
          child: GoogleMap(
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              onCameraMove: (position) {
                controller.cameraPosition = position;
              },
              onMapCreated: (gMController) =>
                  controller.googleMapController.complete(gMController),
              initialCameraPosition: controller.cameraPosition),
        ));
  }
}
