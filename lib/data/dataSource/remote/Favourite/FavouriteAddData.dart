import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class FavouriteAddData {
  CRUD crud;
  FavouriteAddData(this.crud);
  addToFavourite(String userid, String itemsid) async {
    var response = await crud.postData("${AppServer.favourite}add.php",
        {"usersid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
