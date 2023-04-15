import 'package:ebuy/Controller/authControllers/SignUpController.dart';
import 'package:ebuy/core/class/StatusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../view/Widgets/auth/shared/RetryAuthButton.dart';
import '../constant/Images.dart';

class HandlingDataRequest extends GetView<SignUpControllerImp> {
  final StatusRequest statusRequest;
  final void Function() onPressed;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key,
      required this.onPressed,
      required this.statusRequest,
      required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImagesAssets.lottieLoading,
                height: 250, width: 250),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(AppImagesAssets.lottieoffline,
                        height: 250, width: 250),
                    RetryAuthButton(onPressed: onPressed)
                  ],
                ),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(
                          AppImagesAssets.lottieError,
                        ),
                        RetryAuthButton(onPressed: onPressed)
                      ],
                    ),
                  )
                : widget;
  }
}
