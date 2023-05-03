import 'package:ebuy/Controller/authControllers/SignInController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/theme/theme.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/auth/SignIn/ParentWidgets/SignInTextFields.dart';
import 'package:ebuy/view/Widgets/auth/SignIn/ChildrenWidgets/SignInCustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/auth/shared/AuthPageTitle.dart';
import '../../Widgets/auth/shared/HaveAccountAuth.dart';

class SignIn extends GetView<SignInControllerImp> {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerImp());
    return SafeArea(
        child: Scaffold(
            body: GetBuilder<SignInControllerImp>(
      builder: (controller) => HandlingDataRequest(
        onPressed: () => controller.signinRequest(),
        statusRequest: controller.signInStatusRequest,
        widget: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthPageTitle(title: 'Sign In'.tr),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SignInTextFields(),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () =>
                                    Get.toNamed(AppRoutes.checkEmailRoute),
                                child: Text(
                                  'Forgot Password'.tr,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                              SizedBox(
                                height: UINumber.deviceHeight / 2.9,
                              ),
                              const SignInCustomButton(),
                              const SizedBox(
                                height: 10,
                              ),
                              HaveAccountAuth(
                                  authText: "Don't have an account? ".tr,
                                  authType: 'Sign Up'.tr,
                                  onTap: () =>
                                      Get.toNamed(AppRoutes.signUpRoute)),
                            ]))
                  ])),
        ),
      ),
    )));
  }
}
