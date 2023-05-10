import "package:flutter/material.dart";
import 'package:get/get.dart';

abstract class SearchController extends GetxController {}

class SearchControllerimp extends SearchController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  List<Tab> tabs = const [
    Tab(
      text: "Women",
    ),
    Tab(
      text: "Men",
    )
  ];
  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }
}
