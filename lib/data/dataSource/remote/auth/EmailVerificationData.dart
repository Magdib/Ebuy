import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class EmailVerificationData {
  CRUD crud;
  EmailVerificationData({required this.crud});
  postdata(String email, String verifycode) async {
    var response = await crud.postData(AppServer.emailVerification,
        {"email": email, "verifycode": verifycode});

    return response.fold((l) => l, (r) => r);
  }
}
