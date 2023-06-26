import 'dart:io';

import 'package:ebuy/core/class/CRUD.dart';
import 'package:ebuy/core/constant/Server.dart';

class AuthEditData {
  CRUD crud;
  AuthEditData(this.crud);
  editDetailes(String usersid, String userName, String password) async {
    var response = await crud.postData("${AppServer.auth}EditDetailes.php",
        {"usersid": usersid, "username": userName, "password": password});

    return response.fold((l) => l, (r) => r);
  }

  updateUserImage(String usersid, File file, String imageoldname) async {
    var response = await crud.postDataWithFiles(
        "${AppServer.auth}UploadImage.php",
        {
          "usersid": usersid,
          "imageType": "user image",
          "imageoldname": imageoldname
        },
        file);
    return response.fold((l) => l, (r) => r);
  }

  updateBackgroundImage(String usersid, File file, String imageoldname) async {
    var response = await crud.postDataWithFiles(
        "${AppServer.auth}UploadImage.php",
        {
          "usersid": usersid,
          "imageType": "BackGroung",
          "imageoldname": imageoldname
        },
        file);
    return response.fold((l) => l, (r) => r);
  }
}
