import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import '../../../data/dataSource/Static/static.dart';
import '../Home/HomePage/NewTrend/FilterPageWidgets/GreyDivider.dart';

class DetailesDescription extends StatelessWidget {
  const DetailesDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: UINumber.cardElevation,
      child: ListView.separated(
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detailesPageTitleSubtitle[index].title,
                  style: AppTheme.arabicTheme.textTheme.bodyText1!
                      .copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  detailesPageTitleSubtitle[index].subtitle,
                  style: AppTheme.arabicTheme.textTheme.headline6!
                      .copyWith(fontSize: 14),
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const GreyDivider();
        },
      ),
    );
  }
}
