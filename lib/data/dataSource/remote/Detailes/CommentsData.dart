import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class CommentsData {
  CRUD crud;
  CommentsData(this.crud);
  getComments(String itemsid) async {
    var response = await crud
        .postData("${AppServer.comments}view.php", {"itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  addComment(String userid, String itemsid, String username, String commentrate,
      String commentbody) async {
    var response = await crud.postData("${AppServer.comments}add.php", {
      "usersid": userid,
      "itemsid": itemsid,
      "username": username,
      "commentrate": commentrate,
      "commentbody": commentbody
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteComment(String userid, String itemsid, String commentbody) async {
    var response = await crud.postData("${AppServer.comments}delete.php",
        {"usersid": userid, "itemsid": itemsid, "commentbody": commentbody});
    return response.fold((l) => l, (r) => r);
  }
}
