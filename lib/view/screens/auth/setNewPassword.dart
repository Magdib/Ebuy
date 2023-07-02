import 'package:ebuy/Controller/authControllers/SignInController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widgets/shared/TitledTextField.dart';

class SetNewPassword extends StatelessWidget {
  const SetNewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: customAppBar("New Password".tr, context, 0),
            body: GetBuilder<SignInControllerImp>(
              builder: (controller) => HandlingDataRequest(
                onPressed: () => controller.setnewpasswordRequest(),
                statusRequest: controller.newpasswordSR,
                widget: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Form(
                      key: controller.newPasswordFormState,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  TitledTextField(
                                    label: 'Password'.tr,
                                    hint: 'Enter new password'.tr,
                                    obscure: true,
                                    textEditingController:
                                        controller.newPassword,
                                    validator: (val) =>
                                        controller.passwordValidate(val),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TitledTextField(
                                    label: 'Password Confirm'.tr,
                                    hint: 'Re-enter new password'.tr,
                                    obscure: true,
                                    textEditingController:
                                        controller.newPasswordConfirm,
                                    validator: (val) =>
                                        controller.confirmPasswordValidate(val),
                                  ),
                                ],
                              ),
                            ),
                            CustomButton(
                                text: 'Confirm'.tr,
                                onPressed: () => controller.setNewPassword())
                          ]),
                    )),
              ),
            )));
  }
}
