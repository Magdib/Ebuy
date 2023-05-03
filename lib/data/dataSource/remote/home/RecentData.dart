import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class RecentAddData {
  CRUD crud;
  RecentAddData(this.crud);
  addToRecent(String userid, String itemsid) async {
    var response = await crud
        .postData(AppServer.recentAdd, {"usersid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}

class RecentRemoveData {
  CRUD crud;
  RecentRemoveData(this.crud);
  removeFromRecent(String userid, String itemsid) async {
    var response = await crud.postData(
        AppServer.recentRemove, {"usersid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
