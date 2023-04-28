import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class FavouriteRemoveData {
  CRUD crud;
  FavouriteRemoveData(this.crud);
  removeFromFavourite(String userid, String itemsid) async {
    var response = await crud.postData("${AppServer.favourite}remove.php",
        {"usersid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
