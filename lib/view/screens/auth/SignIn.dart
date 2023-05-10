import 'package:ebuy/Controller/authControllers/SignInController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/Colors.dart';
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
            appBar: AppBar(
              title: Text("Sign In",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 20)),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              centerTitle: true,
              elevation: 0,
            ),
            body: GetBuilder<SignInControllerImp>(
              builder: (controller) => HandlingDataRequest(
                onPressed: () => controller.signinRequest(),
                statusRequest: controller.signInStatusRequest,
                widget: Padding(
                    padding:
                        const EdgeInsets.only(right: 5, left: 15, bottom: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SignInTextFields(),
                                const SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () =>
                                      Get.toNamed(AppRoutes.checkEmailRoute),
                                  child: Text(
                                    'Forgot Password'.tr,
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                              ],
                            ),
                          )),
                          const SignInCustomButton(),
                          const SizedBox(
                            height: 10,
                          ),
                          HaveAccountAuth(
                              authText: "Don't have an account? ".tr,
                              authType: 'Sign Up'.tr,
                              onTap: () => Get.toNamed(AppRoutes.signUpRoute))
                        ])),
              ),
            )));
  }
}
