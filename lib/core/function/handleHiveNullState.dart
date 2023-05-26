import 'package:hive_flutter/hive_flutter.dart';

import '../../data/dataSource/Static/HiveKeys.dart';

handleHiveNullState(String hiveKey, dynamic nullValue) {
  dynamic variable;
  Box authBox = Hive.box(HiveBoxes.authBox);
  authBox.get(hiveKey) != null
      ? variable = authBox.get(hiveKey)
      : variable = nullValue;
  return variable;
}
