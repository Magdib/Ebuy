import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/Server.dart';
import '../../../../core/function/Ui Functions/StringToColors.dart';
import '../../../../core/theme/theme.dart';

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
            Hero(
              tag: controller.cartProducts[index].itemsImage!,
              child: CachedNetworkImage(
                imageUrl:
                    "${AppServer.itemsImages}${controller.cartProducts[index].itemsImage!}",
                height: 85,
                width: 87,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),
                Text(controller.cartProducts[index].itemsName!,
                    style: Theme.of(context).textTheme.bodyText1!),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Color:   ',
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
                              controller.cartProducts[index].itemsColor!)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Size:  ${controller.cartProducts[index].itemsSize![0]}',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '\$${controller.cartProducts[index].itemsPrice!}',
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
