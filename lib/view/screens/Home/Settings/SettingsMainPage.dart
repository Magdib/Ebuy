import 'package:ebuy/Controller/Home/SettingsControllers/AccountController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/CustomIcons.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/data/dataSource/Static/static.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widgets/Home/Settings/AccountSettings/AccountPageCard.dart';

class SettingsMainPage extends StatelessWidget {
  const SettingsMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AccountControllerImp());

    return SingleChildScrollView(
      child: SizedBox(
        height: UINumber.deviceHeight / 1.1,
        child: Stack(children: [
          Positioned(
              child: GetBuilder<AccountControllerImp>(
            builder: (controller) => Container(
              width: UINumber.deviceWidth,
              height: UINumber.deviceHeight / 3.5,
              decoration: BoxDecoration(
                color: controller.getBackGroundImage() == false
                    ? AppColors.lightGrey
                    : null,
              ),
              child: Center(
                child: Stack(
                  children: [
                    GetBuilder<AccountControllerImp>(
                      builder: (controller) => CircleAvatar(
                        maxRadius: 45,
                        backgroundColor: AppColors.primaryColor,
                        child: controller.getAccountImage() == false
                            ? Text(
                                controller.authBox.get(HiveKeys.username)[0],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(fontSize: 35),
                              )
                            : Image.network(''),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                            maxRadius: 17.5,
                            backgroundColor: AppColors.white,
                            child: IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                color: AppColors.primaryColor,
                                size: 25,
                              ),
                            )))
                  ],
                ),
              ),
            ),
          )),
          Positioned(
              top: 15,
              right: 0,
              child: IconButton(
                  onPressed: () => Get.toNamed(AppRoutes.settingsPageRoute),
                  icon: const Icon(
                    CustomIcons.settingIcon,
                    color: AppColors.white,
                  ))),
          Positioned(
            top: UINumber.deviceHeight / 4,
            bottom: 20,
            child: Container(
              margin: const EdgeInsets.only(right: 7.5, left: 7.5),
              height: UINumber.deviceHeight - 92,
              width: UINumber.deviceWidth - 15,
              child: Column(
                children: [
                  AccountPageCard(list: controller.accountPageUpperList),
                  const SizedBox(
                    height: 20,
                  ),
                  AccountPageCard(list: controller.accountPageLowerList)
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
