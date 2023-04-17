import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/Colors.dart';
import '../../../../data/dataSource/Static/UINumbers.dart';

class RecentlyViewedStack extends StatelessWidget {
  const RecentlyViewedStack({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: 40,
              width: UINumber.deviceWidth / 2 - 10,
              height: 190,
              child: Card(
                elevation: UINumber.cardElevation,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: AppColors.red,
                          )),
                      Text(
                        'Pull&Bear slim fit t-shirt in rib in white',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 14),
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
            right: 20,
            child: CachedNetworkImage(
              imageUrl: image,
              height: 118,
            ),
          )
        ],
      ),
    );
  }
}
