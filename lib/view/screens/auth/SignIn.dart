import 'package:ebuy/Controller/authControllers/SignInController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/ArgumentsNames.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/auth/SignIn/ParentWidgets/SignInTextFields.dart';
import 'package:ebuy/view/Widgets/auth/SignIn/ChildrenWidgets/SignInCustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/auth/shared/HaveAccountAuth.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Sign In".tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 20)),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              centerTitle: true,
              elevation: 0,
              automaticallyImplyLeading: false,
            ),
            body: GetBuilder<SignInControllerImp>(
              builder: (controller) => HandlingDataRequest(
                onPressed: () => controller.signinRequest(),
                statusRequest: controller.statusRequest,
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
                              onTap: () => Get.toNamed(AppRoutes.signUpRoute,
                                      arguments: {
                                        ArgumentsNames.verified: "1",
                                        ArgumentsNames.isEnglish:
                                            controller.isEnglish
                                      }))
                        ])),
              ),
            )));
  }
}
