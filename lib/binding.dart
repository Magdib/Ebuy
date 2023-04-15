import 'package:ebuy/core/class/CRUD.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CRUD());
  }
}
