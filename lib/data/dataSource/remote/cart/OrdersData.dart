import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class OrdersData {
  CRUD crud;
  OrdersData(this.crud);

  addOrder(
      String usersid,
      String daddressid,
      String baddressid,
      String price,
      String paymentType,
      String deliveryType,
      String giftstate,
      String vouchername) async {
    var response = await crud.postData("${AppServer.orders}add.php", {
      "usersid": usersid,
      "daddressid": daddressid,
      "baddressid": baddressid,
      "price": price,
      "paymentType": paymentType,
      "deliveryType": deliveryType,
      "giftstatus": giftstate,
      "vouchername": vouchername
    });
    return response.fold((l) => l, (r) => r);
  }

  getOrders(String usersid) async {
    var response = await crud
        .postData("${AppServer.orders}view.php", {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
