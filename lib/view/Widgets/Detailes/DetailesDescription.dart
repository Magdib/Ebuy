import 'package:ebuy/Controller/Detailes/detailesController.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../shared/GreyDivider.dart';

class DetailesDescription extends GetView<DetailesControllerImp> {
  const DetailesDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: UINumber.cardElevation,
      child: ListView.separated(
        itemCount: controller.productDesc.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.detailesTitles[index],
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<DetailesControllerImp>(
                  builder: (controller) => Text(
                    controller.productDesc[index],
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 14),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const GreyDivider();
        },
      ),
    );
  }
}
