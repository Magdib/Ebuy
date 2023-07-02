import 'package:ebuy/Controller/authControllers/SignUpController.dart';
import 'package:ebuy/core/class/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                        height: 250, width: 250, repeat: false),
                    RetryAuthButton(onPressed: onPressed)
                  ],
                ),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(AppImagesAssets.lottieError,
                            repeat: false),
                        RetryAuthButton(onPressed: onPressed)
                      ],
                    ),
                  )
                : widget;
  }
}

class HandlingDataView extends GetView<SignUpControllerImp> {
  final StatusRequest statusRequest;
  final void Function() onPressed;
  final Widget widget;
  const HandlingDataView(
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
                        height: 250, width: 250, repeat: false),
                    RetryAuthButton(onPressed: onPressed)
                  ],
                ),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(AppImagesAssets.lottieError,
                            repeat: false),
                        RetryAuthButton(onPressed: onPressed)
                      ],
                    ),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppImagesAssets.noRecetSearch),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'No Data.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 20),
                            )
                          ],
                        ),
                      )
                    : widget;
  }
}
