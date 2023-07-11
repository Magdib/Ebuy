import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/ArgumentsNames.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/core/localization/handleLanguageApi.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cached_network_image/cached_network_image.dart';

class UserStyleGridView extends GetView<HomePageControllerImp> {
  const UserStyleGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.userStyle.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Styles based on your shopping habits'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.userStyle.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 190,
                      crossAxisSpacing: 20),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () =>
                        Get.toNamed(AppRoutes.detailsPageRoute, arguments: {
                      ArgumentsNames.productD: controller.userStyle[index],
                      ArgumentsNames.recentProducts: controller.recentProduct
                    }),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                            height: 190,
                            width: (UINumber.deviceWidth / 2),
                            child: const Card(
                              elevation: 10,
                              margin: EdgeInsets.only(top: 40),
                            )),
                        Positioned(
                          top: 0,
                          right: 10,
                          child: CachedNetworkImage(
                            imageUrl:
                                "${AppServer.itemsImages}${controller.userStyle[index].itemsImage!}",
                            height: 100,
                          ),
                        ),
                        Positioned(
                          bottom: 40,
                          left: 10,
                          child: Text(
                            handleProductsLanguage(TranslationType.catDetailes,
                                controller.userStyle[index]),
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
                            '\$${controller.userStyle[index].itemsPrice}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Positioned(
                            bottom: 30,
                            left: UINumber.deviceWidth / 3.6,
                            child: GetBuilder<HomePageControllerImp>(
                              builder: (controller) => IconButton(
                                  splashRadius: 14,
                                  onPressed: () =>
                                      controller.addStyleToFavourite(index),
                                  icon: Icon(
                                    Icons.favorite,
                                    color:
                                        controller.userStyle[index].favourite ==
                                                "1"
                                            ? AppColors.red
                                            : AppColors.grey,
                                  )),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        : const SizedBox();
  }
}
