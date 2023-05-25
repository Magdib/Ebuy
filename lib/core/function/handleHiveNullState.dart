import 'package:hive_flutter/hive_flutter.dart';

import '../../data/dataSource/Static/HiveKeys.dart';

void handleHiveNullState(String hiveKey, dynamic variable, value, nullValue) {
  Box authBox = Hive.box(HiveBoxes.authBox);
  authBox.get(hiveKey) != null ? variable = value : variable = nullValue;
}
