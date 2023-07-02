import 'package:ebuy/Controller/authControllers/SignInController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../data/dataSource/Static/UINumbers.dart';
import '../../Widgets/auth/SignUp/emailVerificatonWidgets/EmailVerificationRichText.dart';

class ForgotPasswordVerificaton extends StatelessWidget {
  const ForgotPasswordVerificaton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: customAppBar('Code Verification'.tr, context, 0),
          body: GetBuilder<SignInControllerImp>(
            builder: (controller) => HandlingDataRequest(
              onPressed: () =>
                  controller.codeVerification(controller.controllerVerifiyCode),
              statusRequest: controller.passwordSR,
              widget: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: UINumber.deviceHeight / 7,
                                      ),
                                      EmailVerificationRichText(
                                          email: controller
                                              .checkEmailTextEditingController
                                              .text),
                                      SizedBox(
                                        height: UINumber.deviceHeight / 5,
                                      ),
                                      OtpTextField(
                                        onSubmit: (val) {
                                          controller.codeVerification(
                                            val,
                                          );
                                        },
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            ),
                                        focusedBorderColor:
                                            AppColors.primaryColor,
                                        cursorColor: AppColors.primaryColor,
                                        numberOfFields: 5,
                                      ),
                                    ]))
                          ]))),
            ),
          )),
    );
  }
}
