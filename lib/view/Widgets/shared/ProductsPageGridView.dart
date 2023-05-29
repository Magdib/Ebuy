import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/ArgumentsNames.dart';
import '../../../core/constant/Server.dart';
import '../../../core/theme/theme.dart';
import '../../../data/model/HomePageModels/itemsModel.dart';
import '../../../routes.dart';

class ProductsPageGridView extends StatelessWidget {
  const ProductsPageGridView({
    super.key,
    required this.productsList,
    required this.allProducts,
    required this.isScrollable,
  });
  final List<Products> productsList;
  final List<Products> allProducts;
  final bool isScrollable;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          childAspectRatio: 0.9),
      padding: const EdgeInsets.only(top: 20),
      physics:
          isScrollable == false ? const NeverScrollableScrollPhysics() : null,
      shrinkWrap: !isScrollable,
      itemCount: productsList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.detailsPageRoute, arguments: {
            ArgumentsNames.productD: productsList[index],
            ArgumentsNames.productListD: allProducts
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
                  tag: productsList[index].itemsImage!,
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppServer.itemsImages}${productsList[index].itemsImage!}",
                    height: 100,
                  ),
                ),
              ),
              Positioned(
                bottom: 55,
                left: 20,
                child: Text(
                  productsList[index].itemsName!,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 14),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 20,
                child: Text(
                  '\$${productsList[index].itemsPrice}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
