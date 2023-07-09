import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../../../data/dataSource/Static/UINumbers.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewTrendBanner extends StatelessWidget {
  const NewTrendBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: 164,
            width: UINumber.deviceWidth,
            child: const Card(
              elevation: UINumber.cardElevation,
              margin: EdgeInsets.only(top: 24, left: 5, right: 5),
            )),
        GetBuilder<HomePageControllerImp>(
          builder: (controller) => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "NEW TREND".tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 24),
              ),
              controller.isEnglish == false
                  ? Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppServer.bannersImages}/NewTrendImage.png",
                        height: 164,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: "${AppServer.bannersImages}/NewTrendImage.png",
                      height: 164,
                      fit: BoxFit.fitHeight,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
