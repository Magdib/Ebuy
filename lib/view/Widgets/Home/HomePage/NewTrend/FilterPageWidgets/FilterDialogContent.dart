import 'package:ebuy/data/dataSource/Static/static.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constant/Colors.dart';

import '../../../../../../core/theme/theme.dart';

class FilterDialogContent extends StatelessWidget {
  const FilterDialogContent({
    Key? key,
    required this.filterIndex,
  }) : super(key: key);
  final int filterIndex;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 40,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filterList[filterIndex].type.length,
      itemBuilder: (context, index) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: AppColors.grey),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            filterList[filterIndex].type[index],
            style: AppTheme.arabicTheme.textTheme.headline2!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
