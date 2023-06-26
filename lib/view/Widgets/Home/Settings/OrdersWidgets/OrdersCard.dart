import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebuy/Controller/Home/SettingsControllers/OrdersController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/data/model/ProductModels/OrdersMode.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersCard extends GetView<OrdersControllerimp> {
  const OrdersCard({
    super.key,
    required this.ordersList,
    required this.index,
    this.showPrice,
    this.onTap,
  });
  final int index;
  final void Function()? onTap;
  final List<OrdersModel> ordersList;
  final bool? showPrice;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
              height: 170,
              width: UINumber.deviceWidth,
              child: const Card(
                elevation: 10,
                margin: EdgeInsets.only(top: 20, left: 35),
              )),
          SizedBox(
            height: 180,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "${AppServer.itemsImages}${ordersList[index].itemsImage}",
                  height: 90,
                  width: 75,
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Text(ordersList[index].itemsName!,
                        style: Theme.of(context).textTheme.bodyText1!),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          ordersList[index]
                              .ordersDatetime!
                              .replaceRange(16, null, ''),
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 12),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Order #${ordersList[index].ordersId}',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    showPrice == null
                        ? Text(
                            'Cash on Delivery:',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        : index > 0
                            ? const SizedBox()
                            : Text(
                                'Cash on Delivery:',
                                style: Theme.of(context).textTheme.headline6,
                              )
                  ],
                ),
              ],
            ),
          ),
          onTap != null
              ? Positioned(
                  bottom: 60,
                  right: 30,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.5),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2,
                        )),
                    child: IconButton(
                        padding: const EdgeInsets.all(0),
                        splashRadius: 14,
                        iconSize: 16,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: AppColors.primaryColor,
                        )),
                  ),
                )
              : const SizedBox(),
          Positioned(
              bottom: 30,
              right: 30,
              child: showPrice == null
                  ? Text(
                      "\$${ordersList[index].ordersPrice}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 18),
                    )
                  : index > 0
                      ? Text(
                          'The first product shows the total price',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 15),
                        )
                      : Text(
                          "\$${ordersList[index].ordersPrice}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 18),
                        )),
        ],
      ),
    );
  }
}
