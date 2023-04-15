import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/Images.dart';

import '../../../../core/theme/theme.dart';
import '../../../../data/dataSource/Static/UINumbers.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);
  final String title;
  final String image;
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
              title,
              style: AppTheme.arabicTheme.textTheme.bodyText1!
                  .copyWith(fontSize: 24),
            ),
            SvgPicture.asset(image)
          ],
        ),
      ],
    );
  }
}
