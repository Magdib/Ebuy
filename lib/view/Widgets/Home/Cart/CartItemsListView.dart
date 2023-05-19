import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/Home/CartController.dart';
import '../../../../core/constant/Colors.dart';
import '../../../../data/dataSource/Static/UINumbers.dart';
import 'CartProductsDetailes.dart';
import '../../shared/ProductNumbers.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      builder: (controller) => Expanded(
        child: ListView.separated(
          itemCount: controller.cartProducts.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onLongPress: () => controller.showDeleteButton(index),
            child: Stack(
              children: [
                SizedBox(
                    height: 150,
                    width: UINumber.deviceWidth,
                    child: const Card(
                      elevation: 10,
                      margin: EdgeInsets.only(top: 20, left: 46, right: 20),
                    )),
                CartProductsDetailes(index: index),
                const Positioned(
                    bottom: 30, right: 30, child: ProductNumbers()),
                Positioned(
                    right: 0,
                    top: 35,
                    child: Visibility(
                      visible: controller.cartProducts[index].cartDelete,
                      child: MaterialButton(
                        onPressed: () => print("Removed"),
                        color: AppColors.red,
                        minWidth: 45,
                        padding: const EdgeInsets.all(0),
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: const Icon(
                          Icons.close,
                          color: AppColors.white,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
