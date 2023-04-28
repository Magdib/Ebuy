import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebuy/Controller/Detailes/detailesController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailsImagesview extends GetView<DetailesControllerImp> {
  const DetailsImagesview({super.key});

  @override
  Widget build(BuildContext context) {
    String image = Get.arguments['image'];
    return InteractiveViewer(
      child: CachedNetworkImage(
        imageUrl: image,
        cacheManager: controller.caheManger,
        fit: BoxFit.contain,
      ),
    );
  }
}
