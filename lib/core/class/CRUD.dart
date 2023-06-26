import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:dartz/dartz.dart';
import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/function/checkInternet.dart';
import 'package:http/http.dart' as http;

class CRUD {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkinternet()) {
      log("SendingRequest<<");
      var response = await http.post(Uri.parse(linkurl), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        print(responseBody);

        return Right(responseBody);
      } else {
        return left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map>> postDataWithFiles(
      String linkurl, Map data, File file) async {
    if (await checkinternet()) {
      var request = http.MultipartRequest("POST", Uri.parse(linkurl));
      var length = await file.length();
      var stream = http.ByteStream(file.openRead());
      var multipartFile = http.MultipartFile("image", stream, length,
          filename: basename(file.path));
      request.files.add(multipartFile);
      data.forEach((key, value) {
        request.fields[key] = value;
      });
      log("Sending //File// Request<<");
      var dataRequest = await request.send();
      log("SendingRequest<<");
      var response = await http.Response.fromStream(dataRequest);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        print(responseBody);
        return Right(responseBody);
      } else {
        return left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
