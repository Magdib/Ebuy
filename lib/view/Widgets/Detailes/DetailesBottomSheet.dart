import 'package:ebuy/Controller/Detailes/detailesController.dart';
import 'package:ebuy/core/constant/AppWords.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/Colors.dart';

import '../../../data/dataSource/Static/UINumbers.dart';
import '../shared/CustomButton.dart';
import '../shared/ProductNumbers.dart';
import 'DetailesBottomCard.dart';
import 'DetailesColorsListView.dart';
import 'DetailesSizesListView.dart';

class DetailesBottomSheet extends GetView<DetailesControllerImp> {
  const DetailesBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UINumber.deviceHeight / 1.4,
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.close,
                  color: AppColors.grey,
                  size: 30,
                )),
          ),
          const DetailesBottomCard(),
          Text(
            'Color:',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const DetailesColorsListView(),
          Text(
            'Size:',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const DetailesSizesListView(),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Amount:',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const ProductNumbers(),
              ],
            ),
          ),
          CustomButton(
            text: 'Add to cart',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}