import 'package:ebuy/core/constant/Colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../data/dataSource/Static/UINumbers.dart';

class SavedItemsStack extends StatelessWidget {
  const SavedItemsStack({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);
  final String name;
  final int price;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: 120,
            width: UINumber.deviceWidth,
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.only(top: 30, left: 46, right: 5),
              child: Padding(
                padding:
                    EdgeInsets.only(left: UINumber.deviceWidth / 1.7, top: 25),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.5),
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2,
                      )),
                  child: IconButton(
                      padding: const EdgeInsets.all(0),
                      splashRadius: 14,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: AppColors.primaryColor,
                      )),
                ),
              ),
            )),
        SizedBox(
          height: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                image,
                height: 85,
                width: 87,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    name,
                    style: AppTheme.arabicTheme.textTheme.bodyText2!
                        .copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$$price',
                    style: AppTheme.arabicTheme.textTheme.bodyText1!
                        .copyWith(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
