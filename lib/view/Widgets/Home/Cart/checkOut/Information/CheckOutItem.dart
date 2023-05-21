import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/core/function/StringToColors.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutItem extends GetView<CartControllerImp> {
  const CheckOutItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: 150,
            width: UINumber.deviceWidth,
            child: const Card(
              elevation: 10,
              margin: EdgeInsets.only(top: 20, left: 26),
            )),
        SizedBox(
          height: 160,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Hero(
                tag: controller.cartProducts[0].itemsImage!,
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppServer.itemsImages}${controller.cartProducts[0].itemsImage!}",
                  height: 105,
                  width: 87,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Text(controller.cartProducts[0].itemsName!,
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
                                controller.cartProducts[0].itemsColor!)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Size:  ${controller.cartProducts[0].itemsSize![0]}',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 14),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Amount:  1',
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
                    'Total:',
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 30,
            right: 30,
            child: Text(
              "\$${controller.getItemTotalPrice(0)}",
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
            )),
      ],
    );
  }
}
