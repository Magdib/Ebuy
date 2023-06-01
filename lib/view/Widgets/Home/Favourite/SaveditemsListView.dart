import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/Controller/Home/favouritePageController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/core/function/UiFunctions/StringToColors.dart';
import 'package:ebuy/data/model/favouriteModel/favouriteModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'FavouriteCard.dart';

class SaveditemsListView extends StatelessWidget {
  const SaveditemsListView({
    Key? key,
    required this.favouriteList,
  }) : super(key: key);
  final List<Favourite> favouriteList;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteControllerImp>(
      builder: (controller) => HandlingDataRequest(
        onPressed: () => controller.getData(true),
        statusRequest: controller.statusRequest,
        widget: RefreshIndicator(
          onRefresh: () => controller.refreshData(),
          color: AppColors.primaryColor,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
            itemCount: favouriteList.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => controller.goToDetaielsPage(index),
              child: Stack(
                children: [
                  const FavouriteCard(),
                  SizedBox(
                    height: 170,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Hero(
                          tag: favouriteList[index].itemsImage!,
                          child: CachedNetworkImage(
                            imageUrl:
                                "${AppServer.itemsImages}${favouriteList[index].itemsImage}",
                            height: 85,
                            width: 87,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 35,
                            ),
                            Text(
                              favouriteList[index].itemsName!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Color:   ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: 14),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: stringToColor(
                                          favouriteList[index].itemsColor!)),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Size:  ${favouriteList[index].itemsSize}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '\$${favouriteList[index].itemsPrice}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
