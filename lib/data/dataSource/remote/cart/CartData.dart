import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class CartData {
  CRUD crud;
  CartData(this.crud);
  getItemCount(String userid, String itemsid) async {
    var response = await crud.postData("${AppServer.cart}getItemsCount.php",
        {"usersId": userid, "itemsId": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  addToCart(String userid, String itemsid, String itemsColor, String itemsSize,
      String itemsAmount) async {
    var response = await crud.postData("${AppServer.cart}add.php", {
      "usersId": userid,
      "itemsId": itemsid,
      "itemsColor": itemsColor,
      "itemsSize": itemsSize,
      "itemsAmount": itemsAmount
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFromCart(String userid, String itemsid, String itemsAmount) async {
    var response = await crud.postData("${AppServer.cart}remove.php",
        {"usersId": userid, "itemsId": itemsid, "itemsAmount": itemsAmount});
    return response.fold((l) => l, (r) => r);
  }

  getCartItems(String usersid) async {
    var response =
        await crud.postData("${AppServer.cart}view.php", {"usersId": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
