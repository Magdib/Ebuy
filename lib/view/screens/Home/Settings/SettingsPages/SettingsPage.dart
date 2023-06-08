import 'package:ebuy/Controller/Home/SettingsControllers/AccountController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Widgets/Home/Settings/AccountSettings/AccountPageFCard.dart';

class SettingsPage extends GetView<AccountControllerImp> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting'.tr,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: AccountPageFCard(list: controller.settingsList)),
    );
  }
}
