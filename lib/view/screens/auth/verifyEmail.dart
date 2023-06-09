import 'package:ebuy/Controller/authControllers/SignUpController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../data/dataSource/Static/UINumbers.dart';
import '../../Widgets/auth/SignUp/emailVerificatonWidgets/EmailVerificationRichText.dart';

class EmailVerification extends GetView<SignUpControllerImp> {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return SafeArea(
        child: GetBuilder<SignUpControllerImp>(
      builder: (controller) => Scaffold(
          appBar: customAppBar('Email Verification'.tr, context, 0),
          body: HandlingDataRequest(
            onPressed: () =>
                controller.emailVerifiy(controller.controllerverifycode!),
            statusRequest: controller.verifyEmailStatusRequest,
            widget: SingleChildScrollView(
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: UINumber.deviceHeight / 7,
                                    ),
                                    EmailVerificationRichText(
                                        email: controller.email!.text),
                                    SizedBox(
                                      height: UINumber.deviceHeight / 5,
                                    ),
                                    OtpTextField(
                                      onSubmit: (val) {
                                        controller.emailVerifiy(val);
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
          )),
    ));
  }
}
