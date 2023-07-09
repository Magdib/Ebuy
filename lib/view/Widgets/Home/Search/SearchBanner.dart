import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebuy/Controller/Home/SearchController.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/core/localization/HandlePosition.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/data/model/HomePageModels/BannersModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBannersList extends StatelessWidget {
  const SearchBannersList({
    super.key,
    required this.banners,
  });
  final List<Banners> banners;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchControllerImp>(
      builder: (controller) => ListView.separated(
        itemCount: banners.length,
        padding: const EdgeInsets.only(bottom: 20),
        separatorBuilder: (context, index) => const SizedBox(
          height: 24,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () =>
              controller.goToSearchCategory(banners[index].bannerTitle!),
          child: Stack(
            children: [
              SizedBox(
                  height: 160,
                  width: UINumber.deviceWidth,
                  child: const Card(
                    elevation: UINumber.cardElevation,
                    margin: EdgeInsets.only(top: 35, left: 5, right: 5),
                  )),
              HandlePosition(
                top: 30,
                left: 20,
                child: Padding(
                  padding: const EdgeInsets.only(top: 55.0),
                  child: Text(
                    banners[index].bannerTitle!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 24),
                  ),
                ),
              ),
              HandlePosition(
                top: 0,
                right: 20,
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppServer.bannersImages}/${banners[index].bannerImage}",
                  width: 120,
                  height: 130,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
