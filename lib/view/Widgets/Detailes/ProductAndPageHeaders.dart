import 'package:ebuy/Controller/Detailes/detailesController.dart';
import 'package:ebuy/data/dataSource/Static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/constant/Colors.dart';
import '../../../data/dataSource/Static/UINumbers.dart';

class ProductAndPageHeaders extends GetView<DetailesControllerImp> {
  const ProductAndPageHeaders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UINumber.deviceHeight / 3,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              width: 233,
              height: UINumber.deviceHeight / 3,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: productImages.length,
                itemBuilder: (context, index) => Image.asset(
                  productImages[index],
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      splashRadius: 22,
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.grey,
                      )),
                  IconButton(
                      splashRadius: 22,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: AppColors.grey,
                      )),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                      effect: const WormEffect(
                        spacing: 4,
                        activeDotColor: AppColors.primaryColor,
                        dotHeight: 5,
                        dotWidth: 5,
                      ),
                      controller: controller.pageController,
                      count: 4),
                  GestureDetector(
                    onTap: () => controller.addToFavourite(),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.5),
                              blurRadius: 4,
                            )
                          ]),
                      child: GetBuilder<DetailesControllerImp>(
                        builder: (controller) => Icon(
                          Icons.favorite,
                          color: controller.isFavourite == true
                              ? AppColors.red
                              : AppColors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}
