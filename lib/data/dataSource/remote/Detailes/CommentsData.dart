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

  addComment(String userid, String itemsid, String commentrate,
      String commentbody) async {
    var response = await crud.postData("${AppServer.comments}add.php", {
      "usersid": userid,
      "itemsid": itemsid,
      "commentrate": commentrate,
      "commentbody": commentbody
    });
    return response.fold((l) => l, (r) => r);
  }

  editComment(String itemsid, String commentid, String commentrate,
      String commentbody) async {
    var response = await crud.postData("${AppServer.comments}edit.php", {
      "commentid": commentid,
      "itemsid": itemsid,
      "commentrate": commentrate,
      "commentbody": commentbody
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteComment(String commentid) async {
    var response = await crud
        .postData("${AppServer.comments}delete.php", {"commentid": commentid});
    return response.fold((l) => l, (r) => r);
  }
}
