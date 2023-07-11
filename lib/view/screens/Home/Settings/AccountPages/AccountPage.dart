import 'package:ebuy/Controller/Home/SettingsControllers/AccountController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/CustomIcons.dart';
import 'package:ebuy/data/model/authModels/AccountFListModel.dart';
import 'package:ebuy/data/model/authModels/AccountListModel.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/Home/Settings/AccountSettings/AccountPageCard.dart';
import 'package:ebuy/view/Widgets/Home/Settings/AccountSettings/AccountPageFCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends GetView<AccountControllerImp> {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Account'.tr,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          elevation: 8,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.toNamed(AppRoutes.settingsPageRoute),
                icon: const Icon(
                  CustomIcons.settingIcon,
                  color: AppColors.grey,
                )),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            AccountPageCard(list: [
              AccountListModel(
                  leadingIcon: Icons.card_giftcard,
                  text: 'Gift cards & voucher'.tr,
                  page: AppRoutes.giftCardVoucherPageRoute)
            ]),
            const SizedBox(
              height: 20,
            ),
            AccountPageFCard(list: controller.accountpageList),
            const SizedBox(
              height: 20,
            ),
            AccountPageFCard(list: [
              AccountFListModel(
                  leadingIcon: Icons.logout,
                  text: 'Sign out'.tr,
                  onTap: () => controller.signOut())
            ]),
          ],
        ),
      ),
    );
  }
}
