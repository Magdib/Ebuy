import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/core/function/UiFunctions/StringToColors.dart';
import 'package:ebuy/core/function/UiFunctions/fixPriceNumbers.dart';
import 'package:ebuy/core/localization/HandlePosition.dart';
import 'package:ebuy/core/localization/handleLanguageApi.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutItems extends StatelessWidget {
  const CheckOutItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutControllerimp>(
      builder: (controller) => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.cartProducts.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemBuilder: (context, index) => Stack(
          children: [
            SizedBox(
                height: 150,
                width: UINumber.deviceWidth,
                child: Card(
                  elevation: 10,
                  margin: handleEdgeInsets(20, 0, 26, 0),
                )),
            SizedBox(
              height: 160,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "${AppServer.itemsImages}${controller.cartProducts[index].itemsImage!}",
                    height: 105,
                    width: 87,
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
                                color: stringToColor(controller
                                    .cartProducts[index].cartItemsColor!)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${"Size:  ".tr}${controller.cartProducts[index].cartItemsSize![0]}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 14),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${"Amount:  ".tr}${controller.cartProducts[index].cartCount}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: controller.isEnglish == true ? 30 : 7.5,
                      ),
                      Text(
                        'Total:'.tr,
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  ),
                ],
              ),
            ),
            HandlePosition(
                bottom: controller.isEnglish == true ? 32.5 : 25,
                right: 30,
                child: Text(
                  "\$${fixPriceNumbers(controller.cartProducts[index].cartPrice!)}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }
}
