import 'package:ebuy/Controller/Detailes/detailesController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/Detailes/DetailesDescription.dart';
import '../../Widgets/Detailes/DetailesSuggestionsCard.dart';
import '../../Widgets/Detailes/ProductAndPageHeaders.dart';
import '../../Widgets/Detailes/ProductDetailesCard.dart';
import '../../Widgets/Detailes/ReviewsCard.dart';
import '../../Widgets/Detailes/SeeAllTextRow.dart';

class DetailsPage extends GetView<DetailesControllerImp> {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DetailesControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              height: UINumber.deviceHeight / 1.13,
              child: CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  SliverAppBar(
                    toolbarHeight: 45,
                    shadowColor: AppColors.white,
                    actions: [
                      IconButton(
                          splashRadius: 14,
                          onPressed: () {
                            controller.shareProduct();
                          },
                          icon: const Icon(
                            Icons.share,
                            color: AppColors.black,
                          ))
                    ],
                    floating: true,
                    backgroundColor: AppColors.white,
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                    (context, index) => Column(
                      children: [
                        const ProductAndPageHeaders(),
                        const ProductDetailesCard(),
                        const DetailesDescription(),
                        const SizedBox(
                          height: 20,
                        ),
                        const ReviewsCard(),
                        const SizedBox(
                          height: 10,
                        ),
                        SeeAllTextRow(
                            onTap: () {}, title: 'You might also like'),
                        const SizedBox(
                          height: 20,
                        ),
                        const DetailesSuggestionsCard(),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SizedBox(
                height: 50,
                width: UINumber.deviceWidth,
                child: CustomButton(
                    text: 'Add to cart',
                    onPressed: () => controller.addToCart()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
