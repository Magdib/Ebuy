import 'package:ebuy/binding.dart';
import 'package:ebuy/core/localization/Localization.dart';
import 'package:ebuy/core/services/intialServices.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/localization/getCurrentLang.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const Ebuy());
}

class Ebuy extends StatelessWidget {
  const Ebuy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: getLocal(),
      translations: Languages(),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      getPages: routes,
      theme: getcurrentTheme(),
    );
  }
}
