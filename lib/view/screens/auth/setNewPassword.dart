import 'package:ebuy/Controller/authControllers/SignInController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/view/Widgets/auth/shared/AuthPageTitle.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/dataSource/Static/UINumbers.dart';
import '../../Widgets/shared/TitledTextField.dart';

class SetNewPassword extends StatelessWidget {
  const SetNewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: GetBuilder<SignInControllerImp>(
      builder: (controller) => HandlingDataRequest(
        onPressed: () => controller.setnewpasswordRequest(),
        statusRequest: controller.setNewPasswordStatusRequest,
        widget: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthPageTitle(title: "New Password".tr),
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: UINumber.deviceHeight / 6,
                                ),
                                Form(
                                  key: controller.newPasswordFormState,
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
                                        validator: (val) => controller
                                            .confirmPasswordValidate(val),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: UINumber.deviceHeight / 3.5,
                                ),
                                CustomButton(
                                    text: 'Confirm'.tr,
                                    onPressed: () =>
                                        controller.setNewPassword())
                              ]))
                    ]))),
      ),
    )));
  }
}
