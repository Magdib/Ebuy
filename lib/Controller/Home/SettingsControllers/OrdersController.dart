import 'package:dartz/dartz.dart';
import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/dataSource/remote/cart/OrdersData.dart';
import 'package:ebuy/data/model/ProductModels/OrdersMode.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class OrdersController extends GetxController {
  void getOrders();
  void goToDetailes(int index);
}

class OrdersControllerimp extends OrdersController
    with GetSingleTickerProviderStateMixin {
  List<String> ordersTrackText = [
    'Placed order',
    'Delivery to shipping units',
    'Orders are being shipped',
    'Delivered successfully'
  ];
  List<Tab> tabsList = const [
    Tab(
      text: 'Pending orders',
    ),
    Tab(
      text: 'Past orders',
    )
  ];
  late List<Icon> orderTrackIcons;
  late List<String?> orderStatusTime = [];
  Box authBox = Hive.box(HiveBoxes.authBox);
  StatusRequest statusRequest = StatusRequest.loading;
  late TabController tabController;
  OrdersData ordersData = OrdersData(Get.find());
  bool anyOrders = false;
  List<OrdersModel> ordersList = [];
  List<OrdersModel> uiOrdersList = [];
  List<OrdersModel> ordersDetailesList = [];
  List<OrdersModel> pastOrdersList = [];

  @override
  void getOrders() async {
    var response = await ordersData.getOrders(authBox.get(HiveKeys.userid));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List tempOrdersList = response['data'];
        ordersList.addAll(tempOrdersList.map((e) => OrdersModel.fromJson(e)));
        uiOrdersList.addAll(tempOrdersList.map((e) => OrdersModel.fromJson(e)));
        anyOrders = true;
        //The code here must be done in backend but for the lack of knowledge i wrote it here in flutter
        for (int i = 0; i < uiOrdersList.length; i++) {
          int index = uiOrdersList.indexWhere((order) =>
              order.ordersId == uiOrdersList[i].ordersId &&
              order.itemsName != uiOrdersList[i].itemsName);
          if (index != -1) {
            uiOrdersList[i].itemsName = "More than one product";
            uiOrdersList.removeAt(index);
          }
        }
        uiOrdersList.sort(
            (a, b) => int.parse(a.ordersId!).compareTo(int.parse(b.ordersId!)));
      }
    }
    update();
  }

  @override
  void goToDetailes(int index) {
    if (tabController.index == 0) {
      ordersDetailesList = ordersList
          .where((order) =>
              order.ordersId!.contains(uiOrdersList[index].ordersId!))
          .toList();
    } else {
      ordersDetailesList = pastOrdersList
          .where((order) =>
              order.ordersId!.contains(pastOrdersList[index].ordersId!))
          .toList();
    }
    Get.toNamed(AppRoutes.orderTrackPageRoute);
    orderTrackIcons = [
      Icon(
        Icons.shopping_cart,
        color: ordersDetailesList[0].ordersStatus == "0"
            ? AppColors.white
            : AppColors.primaryColor,
      ),
      Icon(
        FontAwesomeIcons.shop,
        color: ordersDetailesList[0].ordersStatus == "1"
            ? AppColors.white
            : AppColors.primaryColor,
      ),
      Icon(FontAwesomeIcons.truck,
          color: ordersDetailesList[0].ordersStatus == "2"
              ? AppColors.white
              : AppColors.primaryColor),
      Icon(Icons.favorite,
          color: ordersDetailesList[0].ordersStatus == "3"
              ? AppColors.white
              : AppColors.primaryColor)
    ];
    orderStatusTime = [
      ordersDetailesList[0].ordersDatetime!,
      ordersDetailesList[0].ordersSudatetime,
      ordersDetailesList[0].ordersSdatetime,
      ordersDetailesList[0].ordersDdatetime
    ];
    for (int i = 0; i < orderStatusTime.length; i++) {
      print(orderStatusTime[i]);
    }
  }

  @override
  void onInit() {
    getOrders();
    tabController = TabController(length: tabsList.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
