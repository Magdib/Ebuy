import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Detailes/detailesController.dart';
import '../../../core/constant/Server.dart';
import '../../../data/dataSource/Static/UINumbers.dart';

class DetailesBottomCard extends GetView<DetailesControllerImp> {
  const DetailesBottomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: 120,
            width: UINumber.deviceWidth,
            child: const Card(
              elevation: 10,
              margin: EdgeInsets.only(
                top: 20,
                left: 46,
              ),
            )),
        SizedBox(
          height: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Hero(
                tag: controller.product.itemsImage!,
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppServer.itemsImages}${controller.productImages[controller.imagesController!.page!.round()]}",
                  height: 100,
                  width: 87,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(controller.product.itemsName!,
                      style: Theme.of(context).textTheme.bodyText1!),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Warehouse: ${controller.product.itemsCount}',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 30,
            right: 20,
            child: Text(
              "\$${controller.product.itemsPrice!}",
              style: Theme.of(context).textTheme.bodyText1,
            )),
      ],
    );
  }
}
