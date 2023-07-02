import 'package:ebuy/Controller/authControllers/SignInController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/ArgumentsNames.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes.dart';

import '../../Widgets/shared/TitledTextField.dart';
import '../../Widgets/auth/shared/HaveAccountAuth.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: customAppBar("Email Check".tr, context, 0),
            body: GetBuilder<SignInControllerImp>(
              builder: (controller) => HandlingDataRequest(
                onPressed: () => controller.sendVerifiyCode(),
                statusRequest: controller.emailSR,
                widget: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 2,
                            child: Form(
                              key: controller.checkEmailFormState,
                              child: TitledTextField(
                                label: 'Email'.tr,
                                hint: 'Enter email'.tr,
                                obscure: false,
                                textEditingController:
                                    controller.checkEmailTextEditingController,
                                validator: (val) =>
                                    controller.emailValidate(val),
                              ),
                            ),
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
                              onTap: () => Get.offNamed(AppRoutes.signUpRoute,
                                      arguments: {
                                        ArgumentsNames.verified: "1",
                                        ArgumentsNames.isEnglish:
                                            controller.isEnglish
                                      })),
                        ])),
              ),
            )));
  }
}
