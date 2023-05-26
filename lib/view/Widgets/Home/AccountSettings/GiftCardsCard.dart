import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';

import '../../shared/CustomContainer.dart';

class GiftCardsCard extends StatelessWidget {
  const GiftCardsCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });
  final String text;
  final IconData icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
          height: 100,
          width: UINumber.deviceWidth / 2.25,
          radius: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 14),
                ),
              )
            ],
          )),
    );
  }
}
