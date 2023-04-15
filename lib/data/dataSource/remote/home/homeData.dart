import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class HomeData {
  CRUD crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.postData(AppServer.home, {});
    return response.fold((l) => l, (r) => r);
  }
}
