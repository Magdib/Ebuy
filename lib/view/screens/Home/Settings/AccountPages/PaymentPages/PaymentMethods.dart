import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/Home/Settings/PaymentWidgets/HandlePayment.dart';
import 'package:ebuy/view/Widgets/shared/CustomPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add payment',
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          elevation: 0,
        ),
        body: HandlePayment(
          paymentState: PaymentState.noMethod,
        ));
  }
}
