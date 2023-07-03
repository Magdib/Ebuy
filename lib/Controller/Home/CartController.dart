import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/data/dataSource/remote/cart/CartData.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../data/model/CartModels/CartModel.dart';

abstract class CartController extends GetxController {
  void showDeleteButton(int index);
  void resetDeleteButton(PointerDownEvent event);
  void refreshData();
  getCartItems(bool showLoading);
  void increaseAmountUI(int index);
  void cartAmountData(int index);
  void decreaseAmountUI(int index);
}

class CartControllerImp extends CartController {
  Box authBox = Hive.box(HiveBoxes.authBox);

  StatusRequest statusRequest = StatusRequest.loading;
  List<CartButtonState> cartButtonStateList = [];
  CartData cartData = CartData(Get.find());
  List<CartModel> cartProducts = [];
  List<CartModel> argumentCartProducts = [];
  List<int> listOfCounts = [];
  List<int> serverListOfCounts = [];
  double totalPrice = 0.0;
  @override
  void showDeleteButton(int index) {
    if (cartButtonStateList[index] == CartButtonState.invisible) {
      cartButtonStateList[index] = CartButtonState.delete;
    }
    update();
  }

  @override
  void resetDeleteButton(PointerDownEvent event) {
    if (event.localPosition.dx < UINumber.deviceWidth - 150) {
      for (int i = 0; i < cartProducts.length; i++) {
        int cartIndex = cartButtonStateList.lastIndexWhere(
            (cartButtonState) => cartButtonState == CartButtonState.delete);
        if (cartIndex != -1) {
          cartButtonStateList[cartIndex] = CartButtonState.invisible;
        }
      }
      update();
    }
  }

  @override
  void refreshData() async {
    await getCartItems(false);
  }

  @override
  getCartItems(bool showLoading) async {
    if (showLoading == true) {
      statusRequest = StatusRequest.loading;
      update();
    }
    var response = await cartData.getCartItems(authBox.get(HiveKeys.userid));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == 'success') {
        if (cartProducts.isNotEmpty) {
          cartProducts.clear();
          argumentCartProducts.clear();
          listOfCounts.clear();
          serverListOfCounts.clear();
          cartButtonStateList.clear();
        }
        List products = response['datacart']['data'];
        cartProducts.addAll(products.map((e) => CartModel.fromJson(e)));
        argumentCartProducts.addAll(products.map((e) => CartModel.fromJson(e)));
        totalPrice = double.parse(response["countprice"]["totalPrice"]);
        for (int i = 0; i < cartProducts.length; i++) {
          listOfCounts.add(int.parse(cartProducts[i].cartCount!));
          serverListOfCounts.add(int.parse(cartProducts[i].cartCount!));
          cartButtonStateList.add(CartButtonState.invisible);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.offlinefailure;
    }

    update();
  }

  @override
  void decreaseAmountUI(int index) {
    if (listOfCounts[index] > 0) {
      listOfCounts[index]--;
    }
    if (listOfCounts[index] == serverListOfCounts[index]) {
      cartButtonStateList[index] = CartButtonState.invisible;
    } else {
      cartButtonStateList[index] = CartButtonState.add;
    }
    update();
  }

  @override
  void increaseAmountUI(int index) {
    if (int.parse(cartProducts[index].itemsCount!) > listOfCounts[index]) {
      listOfCounts[index]++;
      cartButtonStateList[index] = CartButtonState.add;
    }
    if (listOfCounts[index] == serverListOfCounts[index]) {
      cartButtonStateList[index] = CartButtonState.invisible;
    } else {
      cartButtonStateList[index] = CartButtonState.add;
    }
    update();
  }

  @override
  void cartAmountData(int index) async {
    statusRequest = StatusRequest.loading;
    update();
    if (cartButtonStateList[index] == CartButtonState.add) {
      if (listOfCounts[index] < serverListOfCounts[index]) {
        var response = await cartData.removeFromCart(
            authBox.get(HiveKeys.userid),
            cartProducts[index].itemsId!,
            "${serverListOfCounts[index] - listOfCounts[index]}");
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            if (listOfCounts[index] == 0) {
              cartProducts.removeAt(index);
              listOfCounts.removeAt(index);
              serverListOfCounts.removeAt(index);
            } else {
              serverListOfCounts[index] = listOfCounts[index];
              cartProducts[index].itemsDiscount != "0"
                  ? cartProducts[index].cartPrice = double.parse(
                          cartProducts[index].itemsPriceDiscount! *
                              listOfCounts[index])
                      .toStringAsFixed(2)
                  : cartProducts[index].cartPrice =
                      (double.parse(cartProducts[index].itemsPrice!) *
                              listOfCounts[index])
                          .toStringAsFixed(2);
            }
            if (listOfCounts.isEmpty) {
              statusRequest = StatusRequest.failure;
            }
          }
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        var response = await cartData.addToCart(
            authBox.get(HiveKeys.userid),
            cartProducts[index].itemsId!,
            cartProducts[index].cartItemsColor!,
            cartProducts[index].cartItemsSize!,
            "${listOfCounts[index] - serverListOfCounts[index]}");
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success &&
            response['status'] != "success") {
          statusRequest = StatusRequest.serverfailure;
        } else {
          serverListOfCounts[index] = listOfCounts[index];
          cartProducts[index].itemsDiscount != "0"
              ? cartProducts[index].cartPrice = double.parse(
                      cartProducts[index].itemsPriceDiscount! *
                          listOfCounts[index])
                  .toStringAsFixed(2)
              : cartProducts[index].cartPrice =
                  (double.parse(cartProducts[index].itemsPrice!) *
                          listOfCounts[index])
                      .toStringAsFixed(2);
        }
      }
    } else {
      var response = await cartData.removeFromCart(authBox.get(HiveKeys.userid),
          cartProducts[index].itemsId!, "${serverListOfCounts[index]}");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success &&
          response['status'] == "success") {
        cartProducts.removeAt(index);
        listOfCounts.removeAt(index);
        serverListOfCounts.removeAt(index);

        if (listOfCounts.isEmpty) {
          statusRequest = StatusRequest.serverfailure;
        }
      }
    }
    totalPrice = 0.0;
    for (int i = 0; i < cartProducts.length; i++) {
      totalPrice += double.parse(cartProducts[i].cartPrice!);
    }
    cartButtonStateList[index] = CartButtonState.invisible;

    update();
  }

  @override
  void onInit() {
    getCartItems(false);
    super.onInit();
  }
}
