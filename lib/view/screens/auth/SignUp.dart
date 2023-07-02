import 'package:ebuy/Controller/authControllers/SignUpController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/AppWords.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';

import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/auth/shared/HaveAccountAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widgets/auth/SignUp/ChildrenWidgets/SignUpCustomButton.dart';
import '../../Widgets/auth/SignUp/ChildrenWidgets/MostlyIntersetedRichText.dart';
import '../../Widgets/auth/SignUp/ParentWidgets/DropDownButtonsRow.dart';
import '../../Widgets/auth/SignUp/ParentWidgets/EmailLikedListView.dart';
import '../../Widgets/auth/SignUp/ParentWidgets/GenderWearCircle.dart';
import '../../Widgets/auth/SignUp/ParentWidgets/SignUpTextFields.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<SignUpControllerImp>(
      builder: (controller) => Scaffold(
          appBar: customAppBar('Sign Up'.tr, context, 0),
          body: HandlingDataRequest(
            onPressed: () => controller.signupRequest(),
            statusRequest: controller.signUpStatusRequest,
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
                          const SignUpTextFields(),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Date of birth'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 14),
                          ),
                          const DropDownButtonsRow(),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('You need to be 16 or over to use Ebuy'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontSize: 12)),
                          const SizedBox(
                            height: 20,
                          ),
                          const MostlyIntersetedRichText(),
                          const SizedBox(
                            height: 20,
                          ),
                          const GenderWearCircle(),
                          const SizedBox(height: 20),
                          const SizedBox(height: 5),
                          Text(
                            'Tell us which email you\'d like:'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 40),
                          const EmailLikedListView(),
                          InkWell(
                            onTap: () => print(AppWords.websiteWord),
                            child: Text(
                              'Tell me more about these'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontSize: 14),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'By creating your account, you agree to our '.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 7.5),
                          InkWell(
                            onTap: () => print(AppWords.websiteWord),
                            child: Text(
                              'Terms and Conditions & Privacy Policy'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: UINumber.deviceHeight / 3,
                          ),
                          SignUpCustomButton(
                            onPressed: () => controller.signup(),
                            text: 'Sign Up'.tr,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          HaveAccountAuth(
                              authText: 'Have an account? '.tr,
                              authType: "Sign In".tr,
                              onTap: () => Get.back()),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    ));
  }
}
