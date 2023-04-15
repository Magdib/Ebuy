import 'package:ebuy/Controller/Detailes/detailesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/Colors.dart';

import '../../../core/theme/theme.dart';
import '../../../data/dataSource/Static/UINumbers.dart';

class DetailesSuggestionsCard extends GetView<DetailesControllerImp> {
  const DetailesSuggestionsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: controller.suggestions.length,
            mainAxisExtent: 200,
            crossAxisSpacing: 20),
        itemBuilder: (context, index) => Stack(
          children: [
            SizedBox(
                height: 200,
                width: (UINumber.deviceWidth / 2),
                child: const Card(
                  elevation: UINumber.cardElevation,
                  margin: EdgeInsets.only(top: 100),
                )),
            Positioned(
              top: 0,
              left: 6,
              right: 6,
              child: Image.asset(
                controller.suggestions[index].image,
                width: 109,
                height: 135,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              bottom: 40,
              left: 10,
              child: Text(
                controller.suggestions[index].title,
                style: AppTheme.arabicTheme.textTheme.headline6!
                    .copyWith(fontSize: 14),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 10,
              child: Text(
                '\$${controller.suggestions[index].price}',
                style: AppTheme.arabicTheme.textTheme.bodyText1,
              ),
            ),
            Positioned(
                bottom: 0,
                left: UINumber.deviceWidth / 3.6,
                child: GetBuilder<DetailesControllerImp>(
                  builder: (controller) => IconButton(
                      splashRadius: 18,
                      onPressed: () => controller.addItemsToFavourtie(index),
                      icon: controller.suggestions[index].liked == true
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
    );
  }
}
