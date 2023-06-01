import 'package:ebuy/Controller/Home/SettingsControllers/AccountController.dart';
import 'package:ebuy/Controller/Home/SettingsControllers/AddressController.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:ebuy/view/Widgets/shared/CustomConditionButton.dart';
import 'package:ebuy/view/Widgets/shared/TitledTextFiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressName extends GetView<AddressControllerimp> {
  const AddAddressName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Address Name', context, 4),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
        child: Column(
          children: [
            Expanded(
              child: TitledTextFiled(
                label: 'Address Name',
                hint: 'Address name',
                onChanged: (val) => controller.handleAddressAdd(val),
                textEditingController: controller.adNameController,
              ),
            ),
            GetBuilder<AddressControllerimp>(
              builder: (controller) => CustomConditionButton(
                  condition: controller.canAddAddress,
                  onPressed: () => controller.saveAddress(),
                  text: 'Add Address'),
            )
          ],
        ),
      ),
    );
  }
}
