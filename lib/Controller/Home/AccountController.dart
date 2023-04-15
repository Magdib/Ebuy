import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../data/dataSource/Static/HiveKeys.dart';

abstract class AccountController extends GetxController {
  final bool _isThereBackGround = false;
  final bool _isThereAccountImage = false;
}

class AccountControllerImp extends AccountController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  bool getBackGroundImage() => _isThereBackGround;
  bool getAccountImage() => _isThereAccountImage;
}
