import 'package:ebuy/core/constant/AppWords.dart';
import 'package:ebuy/core/function/notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../../data/dataSource/Static/HiveKeys.dart';
import '../function/handleHiveNullState.dart';

class MyServices extends GetxService {
  late Box authBox;
  Future<MyServices> init() async {
    await Firebase.initializeApp();
    await Hive.initFlutter();

    authBox = await Hive.openBox(HiveBoxes.authBox);
    bool notification = handleHiveNullState(HiveKeys.notification, true);
    if (notification == true) {
      FirebaseMessaging.instance.getToken().then((value) {
        print(value);
        String? token = value;
        requestPermissionNotifications();
        fcmConfig();
      });
    }
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
