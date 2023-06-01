import 'package:ebuy/Controller/Home/FilterPageController.dart';
import 'package:ebuy/core/constant/Colors.dart';

import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../../core/theme/theme.dart';
import '../../../Widgets/Home/HomePage/NewTrend/FilterPageWidgets/FilterPageHeaders.dart';
// ignore: unnecessary_import
import 'package:flutter/foundation.dart';

import '../../../Widgets/Home/HomePage/NewTrend/FilterPageWidgets/PriceRangeSliderThumbIcon.dart';

class PricePage extends GetView<FilterPageControllerimp> {
  const PricePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => controller.onWillPop(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Column(
                children: [
                  const FilterPageHeaders(title: 'Price'),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 40, left: 5, right: 5),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.circular(UINumber.borderRadius),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.5),
                            blurRadius: 7,
                          )
                        ]),
                    child: GetBuilder<FilterPageControllerimp>(
                        builder: (controller) => SfRangeSliderTheme(
                              data: SfRangeSliderThemeData(
                                  inactiveLabelStyle: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 13),
                                  activeLabelStyle: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(fontSize: 16),
                                  thumbRadius: 13,
                                  tooltipBackgroundColor:
                                      AppColors.primaryColor,
                                  tooltipTextStyle:
                                      Theme.of(context).textTheme.headline3,
                                  activeTrackHeight: 2,
                                  inactiveTrackHeight: 2),
                              child: SfRangeSlider(
                                  endThumbIcon:
                                      const PriceRangeSliderThumbIcon(),
                                  startThumbIcon:
                                      const PriceRangeSliderThumbIcon(),
                                  activeColor: AppColors.primaryColor,
                                  inactiveColor: AppColors.black,
                                  showLabels: true,
                                  enableTooltip: true,
                                  values: controller.priceRang,
                                  max: 1000,
                                  min: 8,
                                  onChanged: (range) =>
                                      controller.changePriceRange(range)),
                            )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
