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
            widget: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.9),
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () =>
                      Get.toNamed(AppRoutes.detailsPageRoute, arguments: {
                    ArgumentsNames.productD: controller.products[index],
                    ArgumentsNames.productListD: controller.allProducts
                  }),
                  child: Stack(
                    children: [
                      const SizedBox(
                          height: 170,
                          width: double.infinity,
                          child: Card(
                            elevation: 10,
                            margin: EdgeInsets.only(top: 40),
                          )),
                      Positioned(
                        top: 0,
                        right: 10,
                        child: Hero(
                          tag: controller.products[index].itemsImage!,
                          child: CachedNetworkImage(
                            imageUrl:
                                "${AppServer.itemsImages}${controller.products[index].itemsImage!}",
                            height: 100,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 55,
                        left: 20,
                        child: Text(
                          controller.products[index].itemsName!,
                          style: AppTheme.arabicTheme.textTheme.headline6!
                              .copyWith(fontSize: 14),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        left: 20,
                        child: Text(
                          '\$${controller.products[index].itemsPrice}',
                          style: AppTheme.arabicTheme.textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
