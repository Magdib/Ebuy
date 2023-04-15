import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ebuy/core/class/StatusRequest.dart';
import 'package:ebuy/core/function/checkInternet.dart';
import 'package:http/http.dart' as http;

class CRUD {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkinternet()) {
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
}
