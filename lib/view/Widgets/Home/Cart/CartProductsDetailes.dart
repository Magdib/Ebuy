import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/core/localization/handleLanguageApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/Server.dart';
import '../../../../core/function/UiFunctions/StringToColors.dart';

class CartProductsDetailes extends StatelessWidget {
  const CartProductsDetailes({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      builder: (controller) => SizedBox(
        height: 160,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            CachedNetworkImage(
              imageUrl:
                  "${AppServer.itemsImages}${controller.cartProducts[index].itemsImage!}",
              height: 85,
              width: 87,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),
                Text(handleCartLanguage(controller.cartProducts[index]),
                    style: Theme.of(context).textTheme.bodyText1!),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Color:   '.tr,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 14),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: stringToColor(
                              controller.cartProducts[index].selectedcolor!)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${'Size:  '.tr}${controller.cartProducts[index].selectedsize![0]}',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: controller.isEnglish == true ? 30 : 10,
                ),
                Text(
                  '\$${double.parse(controller.cartProducts[index].cartPrice!).toStringAsFixed(2)}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
