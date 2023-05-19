import 'package:flutter/material.dart';

import '../../../core/constant/Colors.dart';
import '../../../data/dataSource/Static/UINumbers.dart';

class ProductNumbers extends StatelessWidget {
  const ProductNumbers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: UINumber.deviceWidth / 3,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.black),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => print('-'),
              icon: const Icon(
                Icons.remove,
                color: AppColors.black,
                size: 15,
              )),
          Text(
            "1",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          IconButton(
              onPressed: () => print('+'),
              icon: const Icon(
                Icons.add,
                color: AppColors.black,
                size: 15,
              ))
        ],
      ),
    );
  }
}
