import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class GetFavouriteData {
  CRUD crud;
  GetFavouriteData(this.crud);
  getFavouriteData(String userid) async {
    var response = await crud.postData(AppServer.favouriteItems, {
      "id": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
