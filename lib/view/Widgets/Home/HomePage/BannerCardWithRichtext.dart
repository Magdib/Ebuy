import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/core/localization/handleLanguageApi.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/data/model/HomePageModels/BannersModel.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class BannerCardWithRichText extends GetView<HomePageControllerImp> {
  const BannerCardWithRichText({
    Key? key,
    required this.banner,
  }) : super(key: key);
  final Banners banner;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: 164,
            width: UINumber.deviceWidth,
            child: const Card(
              elevation: 10,
              margin: EdgeInsets.only(top: 33, left: 5, right: 5),
            )),
        GetBuilder<HomePageControllerImp>(
          builder: (controller) => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text:
                          '\n${handleBannersLanguage(TranslationType.bannerTitle, banner)}\n',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 24)),
                  TextSpan(
                      text:
                          '${handleBannersLanguage(TranslationType.none, banner)}',
                      style: Theme.of(context).textTheme.bodyText1)
                ]),
              ),
              controller.isEnglish == true
                  ? CachedNetworkImage(
                      imageUrl:
                          '${AppServer.bannersImages}/${banner.bannerImage}',
                      width: 120,
                      height: 164,
                      fit: BoxFit.fitHeight,
                    )
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: CachedNetworkImage(
                        imageUrl:
                            '${AppServer.bannersImages}/${banner.bannerImage}',
                        width: 120,
                        height: 164,
                        fit: BoxFit.fitHeight,
                      ),
                    )
            ],
          ),
        ),
      ],
    );
  }
}
