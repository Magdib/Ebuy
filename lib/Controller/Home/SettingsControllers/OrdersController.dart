import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrdersController extends GetxController {}

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

  late TabController tabController;
  @override
  void onInit() {
    tabController = TabController(length: tabsList.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
