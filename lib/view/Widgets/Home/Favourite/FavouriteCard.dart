import 'package:flutter/material.dart';

import '../../../../data/dataSource/Static/UINumbers.dart';

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
          margin: const EdgeInsets.only(top: 20, left: 46, right: 5),
          child: Padding(
            padding: EdgeInsets.only(left: UINumber.deviceWidth / 1.7, top: 85),
          ),
        ));
  }
}
