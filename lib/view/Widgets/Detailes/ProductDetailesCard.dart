import 'package:ebuy/Controller/Detailes/detailesController.dart';
import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/localization/handleLanguageApi.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductDetailesCard extends StatelessWidget {
  const ProductDetailesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 6),
      child: SizedBox(
        height: 100,
        width: UINumber.deviceWidth,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: GetBuilder<DetailesControllerImp>(
            builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  handleProductsLanguage(
                      TranslationType.itemsName, controller.product),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RatingBar.builder(
                          ignoreGestures: true,
                          unratedColor: AppColors.grey,
                          itemSize: 25,
                          initialRating:
                              double.parse(controller.product.itemsRate!),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          glow: false,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star_rate_rounded,
                            color: AppColors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        Text(
                          controller.product.itemsRate!,
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      ],
                    ),
                    controller.product.itemsDiscount == "0"
                        ? Text(
                            "${controller.product.itemsPrice!}\$",
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        : RichText(
                            text: TextSpan(children: [
                            TextSpan(
                                text: "${controller.product.itemsPrice!}\$\n",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        decoration:
                                            TextDecoration.lineThrough)),
                            TextSpan(
                                text:
                                    "${double.parse(controller.product.itemsPriceDiscount!).toStringAsFixed(2)}\$",
                                style: Theme.of(context).textTheme.headline2)
                          ]))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
