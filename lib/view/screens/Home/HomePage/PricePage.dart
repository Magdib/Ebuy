import 'package:ebuy/Controller/Home/FilterPageController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../Widgets/Home/HomePage/NewTrend/FilterPageWidgets/PriceRangeSliderThumbIcon.dart';

class PricePage extends GetView<FilterPageControllerimp> {
  const PricePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Price".tr,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => controller.onWillPop(),
            icon: const Icon(
              Icons.close,
              color: AppColors.black,
            )),
        elevation: 0.0,
      ),
      body: WillPopScope(
        onWillPop: () => controller.onWillPop(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 40, left: 5, right: 5),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(UINumber.borderRadius),
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
                              tooltipBackgroundColor: AppColors.primaryColor,
                              tooltipTextStyle:
                                  Theme.of(context).textTheme.headline3,
                              activeTrackHeight: 2,
                              inactiveTrackHeight: 2),
                          child: SfRangeSlider(
                              endThumbIcon: const PriceRangeSliderThumbIcon(),
                              startThumbIcon: const PriceRangeSliderThumbIcon(),
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
        ),
      ),
    );
  }
}
