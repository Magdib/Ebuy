import 'package:ebuy/Controller/Home/MainPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/Colors.dart';

class CartPage extends GetView<MainContrllerImp> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Cart',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 20),
              ),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () => controller.changePage(0),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.deepGrey,
                  )),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
            ),
            body: Column(
              children: [],
            )));
  }
}
