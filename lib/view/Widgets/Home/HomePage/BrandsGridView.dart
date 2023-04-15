import 'package:flutter/material.dart';

import '../../../../core/constant/Colors.dart';

import '../../../../core/theme/theme.dart';
import '../../../../data/dataSource/Static/UINumbers.dart';
import '../../../../data/dataSource/Static/static.dart';

class BrandsGridView extends StatelessWidget {
  const BrandsGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: brands.length * 21,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            mainAxisExtent: 45,
            crossAxisSpacing: 15),
        itemCount: brands.length,
        itemBuilder: (context, index) => MaterialButton(
          elevation: 0,
          onPressed: () {},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UINumber.borderRadius)),
          color: AppColors.brandsGrey,
          child: Text(
            brands[index],
            style: AppTheme.arabicTheme.textTheme.bodyText1!
                .copyWith(fontSize: 12),
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
