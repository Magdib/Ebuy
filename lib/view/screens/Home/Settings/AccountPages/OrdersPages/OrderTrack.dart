import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/data/dataSource/Static/static.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/CustomPackages/IconStepper.dart';
import 'package:ebuy/view/Widgets/Home/Settings/OrdersWidgets/OrdersCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OrderTrackPage extends StatelessWidget {
  const OrderTrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My orders',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(AppRoutes.searchRoute),
              icon: const Icon(
                Icons.search,
                color: AppColors.deepGrey,
              )),
          IconButton(
              onPressed: () => Get.toNamed(AppRoutes.cartRoute),
              icon: const Icon(
                Icons.shopping_cart,
                color: AppColors.deepGrey,
              ))
        ],
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: OrdersCard(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 500,
                width: 120,
                child: IconStepper(
                  activeStep: 3,
                  lineColor: AppColors.primaryColor,
                  enableStepTapping: false,
                  activeStepBorderColor: AppColors.white,
                  activeStepColor: AppColors.white,
                  stepColor: AppColors.primaryColor,
                  stepPadding: 0,
                  alignment: Alignment.topLeft,
                  enableNextPreviousButtons: false,
                  scrollingDisabled: true,
                  icons: orderTrackIcons,
                  direction: Axis.vertical,
                ),
              ),
              FittedBox(
                child: SizedBox(
                  width: UINumber.deviceWidth / 1.5,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(top: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 55,
                    ),
                    itemBuilder: (context, index) => RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: '${ordersTrackText[index]}\n',
                          style: index < 3
                              ? Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(fontSize: 18)
                              : Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontSize: 18),
                        ),
                        TextSpan(
                          text: index < 3
                              ? 'June 06, 2020 - 08:45 am'
                              : 'Not delivered yet',
                          style: index < 3
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 15, height: 1.5)
                              : Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontSize: 15),
                        )
                      ]),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
