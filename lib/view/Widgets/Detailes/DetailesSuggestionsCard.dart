import 'package:ebuy/Controller/Detailes/detailesController.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/ArgumentsNames.dart';
import '../../../core/constant/Colors.dart';

import '../../../core/theme/theme.dart';
import '../../../data/dataSource/Static/UINumbers.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailesSuggestionsCard extends StatelessWidget {
  const DetailesSuggestionsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailesControllerImp>(
      builder: (controller) => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.similarProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: controller.similarProducts.length,
          mainAxisExtent: 200,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => controller.goToSimilarProduct(index),
          child: Stack(
            children: [
              SizedBox(
                  height: 200,
                  width: (UINumber.deviceWidth / 2),
                  child: const Card(
                    elevation: UINumber.cardElevation,
                    margin: EdgeInsets.only(top: 70),
                  )),
              Positioned(
                top: 10,
                left: 6,
                right: 6,
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppServer.itemsImages}${controller.similarProducts[index].itemsImage}",
                  height: 120,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                bottom: 40,
                left: 10,
                child: Text(
                  controller.similarProducts[index].itemsName!,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 14),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 10,
                child: Text(
                  '\$${controller.similarProducts[index].itemsPrice}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: UINumber.deviceWidth / 3.6,
                  child: GetBuilder<DetailesControllerImp>(
                    builder: (controller) => IconButton(
                        splashRadius: 10,
                        onPressed: () =>
                            controller.similarProductFavState(index),
                        icon: controller.similarProducts[index].favourite == "1"
                            ? const Icon(
                                Icons.favorite,
                                color: AppColors.red,
                              )
                            : const Icon(
                                Icons.favorite,
                                color: AppColors.grey,
                              )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
