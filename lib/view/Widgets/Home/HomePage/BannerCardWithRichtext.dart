import 'package:ebuy/core/constant/Server.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../data/dataSource/Static/UINumbers.dart';
import '../../../../data/model/HomePageModels/BannersModel.dart';

class BannerCardWithRichText extends StatelessWidget {
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: '\n${banner.bannerTitle}\n',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 24)),
                TextSpan(
                    text: '${banner.bannerSubtitile}',
                    style: Theme.of(context).textTheme.bodyText1)
              ]),
            ),
            CachedNetworkImage(
              imageUrl: '${AppServer.bannersImages}/${banner.bannerImage}',
              width: 120,
              height: 164,
              fit: BoxFit.fitHeight,
            )
          ],
        ),
      ],
    );
  }
}
