import 'package:ebuy/Controller/Detailes/detailesController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widgets/Detailes/DetailesBottomSheet.dart';
import '../../Widgets/Detailes/DetailesDescription.dart';
import '../../Widgets/Detailes/DetailesSuggestionsCard.dart';
import '../../Widgets/Detailes/ProductAndPageHeaders.dart';
import '../../Widgets/Detailes/ProductDetailesCard.dart';
import '../../Widgets/Detailes/ReviewsCard.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DetailesControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: GetBuilder<DetailesControllerImp>(
          builder: (controller) => WillPopScope(
            onWillPop: () => controller.onwillPop(),
            child: HandlingDataRequest(
              onPressed: () =>
                  controller.getItemData(controller.olditemid, true),
              statusRequest: controller.statusRequest,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    height: UINumber.deviceHeight / 1.15,
                    child: CustomScrollView(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text(
                                'You might also like',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
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
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: CustomButton(
                        text: 'Add to cart',
                        onPressed: () => Get.bottomSheet(
                              const DetailesBottomSheet(),
                              backgroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              isScrollControlled: true,
                            )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
