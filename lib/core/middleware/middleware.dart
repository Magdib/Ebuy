import 'package:ebuy/core/services/intialServices.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.authBox!.get(HiveKeys.islogin) == "1") {
      Hive.box(HiveBoxes.authBox).close();
      return const RouteSettings(name: AppRoutes.mainPageRoute);
    } else {
      Hive.box(HiveBoxes.authBox).close();
    }
  }
}
