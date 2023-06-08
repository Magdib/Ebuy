import 'package:ebuy/Controller/authControllers/SignInController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/ArgumentsNames.dart';
import 'package:ebuy/view/Widgets/auth/shared/AuthPageTitle.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/dataSource/Static/UINumbers.dart';
import '../../../routes.dart';

import '../../Widgets/shared/TitledTextFiled.dart';
import '../../Widgets/auth/shared/HaveAccountAuth.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: GetBuilder<SignInControllerImp>(
      builder: (controller) => HandlingDataRequest(
        onPressed: () => controller.sendVerifiyCode(),
        statusRequest: controller.emailCheckStatusRequest,
        widget: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthPageTitle(
                        title: "Email Check".tr,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: UINumber.deviceHeight / 4,
                                ),
                                Form(
                                  key: controller.checkEmailFormState,
                                  child: TitledTextFiled(
                                    label: 'Email'.tr,
                                    hint: 'Enter email'.tr,
                                    obscure: false,
                                    textEditingController: controller
                                        .checkEmailTextEditingController,
                                    validator: (val) =>
                                        controller.emailValidate(val),
                                  ),
                                ),
                                SizedBox(
                                  height: UINumber.deviceHeight / 3.2,
                                ),
                                CustomButton(
                                    text: 'Check email'.tr,
                                    onPressed: () => controller.checkemail()),
                                const SizedBox(
                                  height: 10,
                                ),
                                HaveAccountAuth(
                                    authText: "Don't have an account? ".tr,
                                    authType: 'Sign Up'.tr,
                                    onTap: () => Get.offNamed(
                                            AppRoutes.signUpRoute,
                                            arguments: {
                                              ArgumentsNames.verified: "1"
                                            })),
                              ]))
                    ]))),
      ),
    )));
  }
}
