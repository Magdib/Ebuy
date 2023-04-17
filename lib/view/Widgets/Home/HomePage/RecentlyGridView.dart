import 'package:flutter/material.dart';

import '../../../../core/constant/Server.dart';
import 'RecentlyViewedStack.dart';

class RecentlyGridView extends StatelessWidget {
  const RecentlyGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
      ),
      itemCount: 2,
      padding: const EdgeInsets.only(bottom: 80),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        List<String> s = [
          "${AppServer.itemsImages}RedEveningDress.png",
          "${AppServer.itemsImages}GreenEveningDress.png"
        ];
        return RecentlyViewedStack(image: s[index]);
      },
    );
  }
}
