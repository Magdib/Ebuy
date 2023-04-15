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
              padding: const EdgeInsets.only(left: 15, right: 15),
              height: UINumber.deviceHeight / 1.13,
              child: CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  GetBuilder<DetailesControllerImp>(
                    builder: (controller) => SliverAppBar(
                      toolbarHeight: 30,
                      automaticallyImplyLeading: false,
                      shadowColor: AppColors.white,
                      elevation: 0,
                      floating: true,
                      backgroundColor: AppColors.white,
                      flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          background: Offstage(
                            offstage: controller.hideSliverAppBar,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () => Get.back(),
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: AppColors.black,
                                    )),
                                IconButton(
                                    splashRadius: 14,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.share,
                                      color: AppColors.black,
                                    )),
                              ],
                            ),
                          )),
                    ),
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
                child: CustomButton(text: 'Add to card', onPressed: () {}),
              ),
            )
          ],
        ),
      ),
    );
  }
}
