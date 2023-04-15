import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class SignUpData {
  CRUD crud;
  SignUpData({required this.crud});
  postdata(String username, String email, String password) async {
    var response = await crud.postData(AppServer.signup,
        {"username": username, "password": password, "email": email});

    return response.fold((l) => l, (r) => r);
  }
}
