import 'package:ebuy/Controller/Home/SettingsControllers/AddressController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:ebuy/view/Widgets/shared/CustomConditionButton.dart';
import 'package:ebuy/view/Widgets/shared/TitledTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressName extends GetView<AddressControllerimp> {
  const AddAddressName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Address Name'.tr, context, 4),
      body: GetBuilder<AddressControllerimp>(
        builder: (controller) => WillPopScope(
          onWillPop: () => controller.willPopAddress(),
          child: HandlingDataRequest(
            onPressed: () => controller.saveAddress(),
            statusRequest: controller.addStatusRequest,
            widget: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 5, left: 10, right: 10),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TitledTextField(
                          label: 'Address Name'.tr,
                          hint: 'Enter address name here...'.tr,
                          onChanged: (val) => controller.handleAddressAdd(),
                          textEditingController: controller.adNameController,
                        ),
                        TitledTextField(
                          label: 'Address Phone Number'.tr,
                          hint: 'Enter address Phone Number here...'.tr,
                          onChanged: (val) => controller.handleAddressAdd(),
                          textEditingController: controller.adNumberController,
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                  CustomConditionButton(
                      condition: controller.canAddAddress,
                      onPressed: () => controller.saveAddress(),
                      text: controller.editIndex == null
                          ? 'Add address'.tr
                          : 'Edit Address'.tr),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
