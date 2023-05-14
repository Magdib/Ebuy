import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/products/ProductsController.dart';
import '../../../core/constant/ArgumentsNames.dart';
import '../../../core/constant/Server.dart';
import '../../../core/theme/theme.dart';
import '../../Widgets/Home/HomePage/ProductsGridView.dart';
import '../../Widgets/shared/ProductsPageGridView.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductsControllerimp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Text(
            "Products Page",
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
          ),
          centerTitle: true,
          foregroundColor: AppColors.black,
        ),
        body: GetBuilder<ProductsControllerimp>(
          builder: (controller) => HandlingDataRequest(
            onPressed: () => controller.getData(true),
            statusRequest: controller.statusRequest,
            widget: ProductsPageGridView(
              allProducts: controller.allProducts,
              productsList: controller.products,
              isScrollable: true,
            ),
          ),
        ));
  }
}
