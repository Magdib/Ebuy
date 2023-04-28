import 'package:ebuy/Controller/Home/MainPageController.dart';
import 'package:ebuy/Controller/Home/favouritePageController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/Colors.dart';

import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/Home/HomePage/shared/PageHeadersWithCartIcon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/theme.dart';
import '../../Widgets/Home/Favourite/SaveditemsListView.dart';

class FavouritePage extends GetView<MainContrllerImp> {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouriteControllerImp favouriteControllerImp =
        Get.put(FavouriteControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Saved Items',
          style:
              AppTheme.arabicTheme.textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => controller.changePage(0),
            icon: const Icon(Icons.arrow_back, color: AppColors.deepGrey)),
        actions: [
          IconButton(
              onPressed: () => controller.changePage(2),
              icon: const Icon(Icons.shopping_cart, color: AppColors.deepGrey)),
        ],
        backgroundColor: AppColors.white,
        bottom: TabBar(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: AppColors.grey,
            controller: favouriteControllerImp.tabController,
            tabs: favouriteControllerImp.tabs,
            indicatorColor: AppColors.primaryColor,
            unselectedLabelStyle: AppTheme.arabicTheme.textTheme.headline2!
                .copyWith(fontSize: 16),
            labelStyle: AppTheme.arabicTheme.textTheme.bodyText1!
                .copyWith(fontSize: 16)),
      ),
      body: TabBarView(
          controller: favouriteControllerImp.tabController,
          children: [const SaveditemsListView(), Column()]),
    );
  }
}
// import 'package:ebuy/Controller/Home/MainPageController.dart';
// import 'package:ebuy/Controller/Home/favouritePageController.dart';
// import 'package:ebuy/core/class/HandlingDataRequest.dart';
// import 'package:ebuy/core/constant/Colors.dart';

// import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
// import 'package:ebuy/view/Widgets/Home/HomePage/shared/PageHeadersWithCartIcon.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/theme/theme.dart';
// import '../../Widgets/Home/Favourite/FavouriteTapBar.dart';
// import '../../Widgets/Home/Favourite/SaveditemsListView.dart';

// class FavouritePage extends GetView<MainContrllerImp> {
//   const FavouritePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     FavouriteControllerImp favouriteControllerImp =
//         Get.put(FavouriteControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Saved Items',
//           style:
//               AppTheme.arabicTheme.textTheme.bodyText1!.copyWith(fontSize: 20),
//         ),
//         backgroundColor: AppColors.white,
//         bottom: TabBar(
//             controller: favouriteControllerImp.tabController,
//             tabs: favouriteControllerImp.tabs),
//       ),
//       body: GetBuilder<FavouriteControllerImp>(
//         builder: (favouriteControllerImp) => HandlingDataRequest(
//           onPressed: () => favouriteControllerImp.getData(),
//           statusRequest: favouriteControllerImp.statusRequest,
//           widget: Padding(
//             padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
//             child: Column(
//               children: [
//                 PageHeadersWithCartIcon(
// //                   title: 'Saved Items',
// //                   backFunction: () => controller.changePage(0),
// //                   cartFunction: () => controller.changePage(2),
// //                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
                // const FavouriteTapBar(),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 TabBarView(
//                     controller: favouriteControllerImp.tabController,
//                     children: [const SaveditemsListView(), Column()])
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
