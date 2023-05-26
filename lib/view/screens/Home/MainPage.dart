import 'package:ebuy/Controller/Home/MainPageController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/CustomIcons.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainContrllerImp());
    return GetBuilder<MainContrllerImp>(
      builder: (controller) => controller.isEnglish != null
          ? SafeArea(
              child: Scaffold(
                bottomNavigationBar: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      //the place of the upper Container of the selected item
                      margin: controller.bottomBarHandle(),
                      height: 4,
                      width: UINumber.deviceWidth / 8,
                      color: AppColors.primaryColor,
                      duration: const Duration(milliseconds: 250),
                    ),
                    BottomNavigationBar(
                        items: const <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                              label: '',
                              icon: Icon(
                                Icons.home,
                              )),
                          BottomNavigationBarItem(
                              label: '',
                              icon: Icon(
                                Icons.search,
                              )),
                          BottomNavigationBarItem(
                              label: '',
                              icon: Icon(
                                Icons.shopping_cart,
                              )),
                          BottomNavigationBarItem(
                              label: '',
                              icon: Icon(
                                Icons.favorite,
                              )),
                          BottomNavigationBarItem(
                              label: '',
                              icon: Icon(
                                CustomIcons.personIcon,
                                size: 20,
                              ))
                        ],
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        unselectedItemColor: AppColors.grey,
                        enableFeedback: false,
                        selectedFontSize: 0,
                        currentIndex: controller.bottomBarIndex,
                        selectedItemColor: AppColors.primaryColor,
                        onTap: (page) => controller.changePage(page)),
                  ],
                ),
                body: controller.bottomBarPages[controller.bottomBarIndex],
              ),
            )
          : Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                    AppImagesAssets.lottieSplashScreen,
                  ),
                  AnimatedOpacity(
                    opacity: controller.opacity,
                    duration: const Duration(seconds: 1),
                    child: Text(
                      'E-Buy',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
