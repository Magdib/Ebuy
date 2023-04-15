import 'package:ebuy/core/constant/AppWords.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../../data/dataSource/Static/HiveKeys.dart';

class MyServices extends GetxService {
  Box? authBox;
  Future<MyServices> init() async {
    await Firebase.initializeApp();
    await Hive.initFlutter();
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    authBox = await Hive.openBox(HiveBoxes.authBox);
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
