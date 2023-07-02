import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class DetailesData {
  CRUD crud;
  DetailesData(this.crud);
  getData(String itemsid, String usersid, String? olditemsid) async {
    olditemsid ??= "none";
    var response = await crud.postData("${AppServer.items}getItemData.php",
        {"itemsid": itemsid, "usersid": usersid, "olditemsid": olditemsid});
    return response.fold((l) => l, (r) => r);
  }
}
