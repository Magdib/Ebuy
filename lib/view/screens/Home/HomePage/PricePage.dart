import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/core/constant/Colors.dart';

import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/src/theme/slider_theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../../core/theme/theme.dart';
import '../../../Widgets/Home/HomePage/NewTrend/FilterPageWidgets/FilterPageHeaders.dart';
import 'package:flutter/foundation.dart';

import '../../../Widgets/Home/HomePage/NewTrend/FilterPageWidgets/PriceRangeSliderThumbIcon.dart';

class PricePage extends StatelessWidget {
  const PricePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Column(
              children: [
                FilterPageHeaders(title: 'Price'),
                SizedBox(
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
                  child: GetBuilder<HomePageControllerImp>(
                      builder: (controller) => SfRangeSliderTheme(
                            data: SfRangeSliderThemeData(
                                inactiveLabelStyle: AppTheme
                                    .arabicTheme.textTheme.bodyText1!
                                    .copyWith(fontSize: 13),
                                activeLabelStyle: AppTheme
                                    .arabicTheme.textTheme.headline2!
                                    .copyWith(fontSize: 16),
                                thumbRadius: 13,
                                tooltipBackgroundColor: AppColors.primaryColor,
                                tooltipTextStyle:
                                    AppTheme.arabicTheme.textTheme.headline3,
                                activeTrackHeight: 2,
                                inactiveTrackHeight: 2),
                            child: SfRangeSlider(
                                endThumbIcon: const PriceRangeSliderThumbIcon(),
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
    );
  }
}
