import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/Colors.dart';

import '../../../../core/theme/theme.dart';
import '../../../../data/dataSource/Static/UINumbers.dart';
import '../../../../data/dataSource/Static/static.dart';

class UserStyleGridView extends StatelessWidget {
  const UserStyleGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: userStyles.length,
            mainAxisExtent: 180,
            crossAxisSpacing: 20),
        itemBuilder: (context, index) => Stack(
          children: [
            SizedBox(
                height: 180,
                width: (UINumber.deviceWidth / 2),
                child: const Card(
                  elevation: 10,
                  margin: EdgeInsets.only(top: 40),
                )),
            Positioned(
              top: 0,
              right: 10,
              child: SvgPicture.asset(
                userStyles[index].image,
              ),
            ),
            Positioned(
              bottom: 40,
              left: 10,
              child: Text(
                userStyles[index].subtitle,
                style: AppTheme.arabicTheme.textTheme.headline6!
                    .copyWith(fontSize: 14),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 10,
              child: Text(
                '\$${userStyles[index].price}',
                style: AppTheme.arabicTheme.textTheme.bodyText1,
              ),
            ),
            Positioned(
                bottom: 30,
                left: UINumber.deviceWidth / 3.6,
                child: IconButton(
                    splashRadius: 14,
                    onPressed: () {},
                    icon: userStyles[index].liked == true
                        ? const Icon(
                            Icons.favorite,
                            color: AppColors.red,
                          )
                        : const Icon(
                            Icons.favorite,
                            color: AppColors.grey,
                          ))),
            Positioned(
              bottom: 0,
              left: UINumber.deviceWidth / 3.6,
              child: IconButton(
                  splashRadius: 14,
                  onPressed: () {},
                  icon: userStyles[index].disliked == true
                      ? const Icon(
                          Icons.thumb_down,
                          color: AppColors.red,
                        )
                      : const Icon(
                          Icons.thumb_down,
                          color: AppColors.grey,
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
