import 'package:ebuy/core/localization/HandlePosition.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160,
        width: UINumber.deviceWidth,
        child: Card(
          elevation: 10,
          margin: handleEdgeInsets(20, 0, 46, 5),
          child: Padding(
            padding: EdgeInsets.only(left: UINumber.deviceWidth / 1.7, top: 85),
          ),
        ));
  }
}
