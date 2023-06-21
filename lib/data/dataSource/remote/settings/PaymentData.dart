import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class PaymentData {
  CRUD crud;
  PaymentData(this.crud);
  addPayments(String usersid, String name, String type, String number,
      String expireDate) async {
    var response = await crud.postData("${AppServer.payment}add.php", {
      "usersid": usersid,
      "name": name,
      "type": type,
      "number": number,
      "expireDate": expireDate
    });
    return response.fold((l) => l, (r) => r);
  }

  editPayment(String paymentid, String name, String type, String number,
      String expireDate) async {
    var response = await crud.postData("${AppServer.payment}edit.php", {
      "paymentid": paymentid,
      "name": name,
      "type": type,
      "number": number,
      "expireDate": expireDate
    });
    return response.fold((l) => l, (r) => r);
  }

  deletePayment(String paymentid) async {
    var response = await crud
        .postData("${AppServer.payment}delete.php", {"paymentid": paymentid});
    return response.fold((l) => l, (r) => r);
  }

  getPayments(String usersid) async {
    var response = await crud
        .postData("${AppServer.payment}view.php", {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
