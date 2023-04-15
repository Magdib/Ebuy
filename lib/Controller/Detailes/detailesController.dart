import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/data/dataSource/Static/static.dart';
import 'package:ebuy/data/model/ProductModels/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/Images.dart';
import '../../data/dataSource/Static/UINumbers.dart';
import '../../data/model/ProductModels/RateModel.dart';

abstract class DetailesController extends GetxController {
  addToFavourite();
  likediLikeComment(int index);
  addItemsToFavourtie(int index);
}

class DetailesControllerImp extends DetailesController {
  ScrollController? scrollController;
  bool hideSliverAppBar = true;
  List<RateModel> usersRate = [
    RateModel(
        username: 'Jack Bibber',
        userImage: AppImagesAssets.user1,
        comment:
            'Nike is a leading sports shoes brand in the world, with a youthful and dynamic',
        rate: 4.5,
        isLiked: false,
        rateTime: '09:30 - 23/09/2020'),
    RateModel(
        username: 'Vie Ruan',
        userImage: AppImagesAssets.user2,
        comment: 'Good, I Recommended it',
        rate: 4.0,
        isLiked: false,
        rateTime: '14:30 - 06/09/2020')
  ];
  bool isFavourite = false;
  PageController pageController = PageController();
  @override
  addToFavourite() {
    isFavourite = !isFavourite;
    update();
  }

  @override
  likediLikeComment(int index) {
    usersRate[index].isLiked = !usersRate[index].isLiked;
    update();
  }

  List<Products> suggestions = [
    Products(
        title: 'Yellow hoodie',
        subtitle: 'subtitle',
        image: AppImagesAssets.youMightAlsoLike1,
        liked: false,
        disliked: false,
        price: 130,
        category: '',
        color: Colors.yellow,
        size: ''),
    Products(
        title: 'Black hoodie',
        subtitle: 'subtitle',
        image: AppImagesAssets.youMightAlsoLike2,
        liked: false,
        disliked: false,
        price: 102,
        category: '',
        color: AppColors.black,
        size: '')
  ];
  @override
  void onInit() {
    scrollController = ScrollController()
      ..addListener(() {
        scrollController!.offset > UINumber.deviceHeight / 6
            ? hideSliverAppBar = false
            : hideSliverAppBar = true;
        update();
      });
    super.onInit();
  }

  @override
  void onClose() {
    scrollController!.dispose();
    super.onClose();
  }

  @override
  addItemsToFavourtie(int index) {
    suggestions[index].liked = !suggestions[index].liked;
    update();
  }
}
