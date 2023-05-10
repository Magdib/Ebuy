import 'package:ebuy/Controller/Detailes/detailesController.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/constant/Colors.dart';
import '../../../data/dataSource/Static/UINumbers.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductAndPageHeaders extends StatelessWidget {
  const ProductAndPageHeaders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UINumber.deviceHeight / 3,
      width: double.infinity,
      child: GetBuilder<DetailesControllerImp>(
        builder: (controller) => Stack(
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
                  controller: controller.imagesController,
                  itemCount: controller.productImages.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.productImagesRoute,
                        arguments: {
                          "image":
                              "${AppServer.itemsImages}${controller.productImages[index]}"
                        }),
                    child: Hero(
                      tag: controller.product.itemsImage!,
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppServer.itemsImages}${controller.productImages[index]}",
                        cacheManager: controller.caheManger,
                        height: UINumber.deviceHeight / 3,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: UINumber.deviceHeight / 6,
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
                        controller: controller.imagesController!,
                        count: controller.productImages.length),
                    GestureDetector(
                      onTap: () => controller.changeFavouriteState(),
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
                            color: controller.product.favourite == "1"
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
      ),
    );
  }
}
