import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class CheckADPAY {
  CRUD crud;
  CheckADPAY(this.crud);
  getData(String usersid) async {
    var response = await crud
        .postData("${AppServer.address}checkAdPay.php", {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
