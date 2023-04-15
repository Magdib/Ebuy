import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class CheckEmailData {
  CRUD crud;
  CheckEmailData({required this.crud});
  postdata(String email) async {
    var response = await crud.postData(AppServer.checkemail, {"email": email});

    return response.fold((l) => l, (r) => r);
  }
}
