import 'package:ebuy/Controller/Home/AccountController.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/view/Widgets/shared/CustomContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<AccountControllerImp>(
              builder: (controller) => controller.isLanguageChanging == false
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Language'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 20,
                            ),
                            child: CustomContainer(
                                height: 72,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                radius: 5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'English'.tr,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    GetBuilder<AccountControllerImp>(
                                        builder: (controller) => Switch(
                                            value: controller.isEnglish,
                                            activeThumbImage: const AssetImage(
                                                AppImagesAssets.aEnglish),
                                            inactiveThumbImage:
                                                const AssetImage(
                                                    AppImagesAssets.aArabic),
                                            onChanged: (val) =>
                                                controller.changeLanguage(val)))
                                  ],
                                ))),
                      ],
                    )
                  : Center(
                      child: Lottie.asset(AppImagesAssets.lottieLanguage),
                    ))),
    );
  }
}
