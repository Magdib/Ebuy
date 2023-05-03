import 'package:ebuy/core/constant/Server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/Images.dart';

import '../../../../core/theme/theme.dart';
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "NEW TREND",
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 24),
            ),
            CachedNetworkImage(
              imageUrl: "${AppServer.bannersImages}/NewTrendImage.png",
              height: 164,
              fit: BoxFit.fitHeight,
            )
          ],
        ),
      ],
    );
  }
}
