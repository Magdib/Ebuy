import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermissionNotifications() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true);
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
  });
}
