import 'package:ebuy/Controller/Home/SettingsControllers/AccountController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/view/Widgets/shared/TitledTextField.dart';
import 'package:ebuy/view/Widgets/shared/CustomConditionButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersDetailes extends StatelessWidget {
  const UsersDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My details'.tr,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<AccountControllerImp>(
        builder: (controller) => HandlingDataRequest(
          onPressed: () => controller.saveDetailes(),
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: controller.detailesFormState,
                  child: Column(
                    children: [
                      TitledTextField(
                        hint: 'Enter user name here...'.tr,
                        label: 'User Name'.tr,
                        obscure: false,
                        textEditingController: controller.userNameController,
                        onChanged: (val) => controller.saveButtonState(),
                        validator: (val) => controller.vaildateUserName(val!),
                      ),
                      TitledTextField(
                        hint: 'Enter Password'.tr,
                        label: 'Password'.tr,
                        obscure: true,
                        textEditingController: controller.passwordController,
                        onChanged: (val) => controller.saveButtonState(),
                        validator: (val) => controller.passwordValidate(val!),
                      ),
                    ],
                  ),
                ),
                GetBuilder<AccountControllerImp>(
                  builder: (controller) => CustomConditionButton(
                      condition: controller.canSaveChanges,
                      onPressed: () => controller.saveDetailes(),
                      text: 'Save changes'.tr),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
