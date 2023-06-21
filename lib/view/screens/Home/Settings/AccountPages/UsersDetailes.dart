import 'package:ebuy/Controller/Home/SettingsControllers/AccountController.dart';
import 'package:ebuy/view/Widgets/shared/TitledTextField.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:ebuy/view/Widgets/shared/CustomConditionButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersDetailes extends GetView<AccountControllerImp> {
  const UsersDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My details',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: controller.detailesFormState,
              child: Column(
                children: [
                  TitledTextField(
                    hint: '',
                    label: 'User Name',
                    obscure: false,
                    textEditingController: controller.userNameController,
                    onChanged: (val) => controller.saveButtonState(),
                    validator: (val) => controller.vaildateUserName(val!),
                  ),
                  TitledTextField(
                    hint: '',
                    label: 'Email address',
                    obscure: false,
                    textEditingController: controller.userEmailController,
                    onChanged: (val) => controller.saveButtonState(),
                    validator: (val) => controller.vaildateEmail(val!),
                  ),
                ],
              ),
            ),
            GetBuilder<AccountControllerImp>(
              builder: (controller) => CustomConditionButton(
                  condition: controller.canSaveChanges,
                  onPressed: () => controller.saveDetailes(),
                  text: 'Save changes'),
            )
          ],
        ),
      ),
    );
  }
}
