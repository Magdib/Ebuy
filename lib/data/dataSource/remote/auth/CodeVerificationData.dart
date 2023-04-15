import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class CodeVerificationData {
  CRUD crud;
  CodeVerificationData({required this.crud});
  postdata(String email, String verifycode) async {
    var response = await crud.postData(
        AppServer.codeVerification, {"email": email, "verifycode": verifycode});

    return response.fold((l) => l, (r) => r);
  }
}
