import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class NewPasswordData {
  CRUD crud;
  NewPasswordData({required this.crud});
  postdata(String email, String password) async {
    var response = await crud.postData(
        AppServer.setNewPassword, {"email": email, "password": password});

    return response.fold((l) => l, (r) => r);
  }
}
