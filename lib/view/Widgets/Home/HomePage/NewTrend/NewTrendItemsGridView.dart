import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/Colors.dart';

import '../../../../../core/theme/theme.dart';
import '../../../../../data/dataSource/Static/static.dart';

class NewTrendItemsGridView extends StatelessWidget {
  const NewTrendItemsGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: 0.9),
        itemCount: newTrend.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              const SizedBox(
                  height: 155,
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    margin: EdgeInsets.only(top: 40),
                  )),
              Positioned(
                top: 0,
                right: 10,
                child: SvgPicture.asset(
                  newTrend[index].image,
                ),
              ),
              Positioned(
                bottom: 55,
                left: 20,
                child: Text(
                  newTrend[index].category,
                  style: AppTheme.arabicTheme.textTheme.headline6!
                      .copyWith(fontSize: 14),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 20,
                child: Text(
                  '\$${newTrend[index].price}',
                  style: AppTheme.arabicTheme.textTheme.bodyText1,
                ),
              ),
              Positioned(
                  bottom: 18,
                  left: 110,
                  child: IconButton(
                      onPressed: () {},
                      icon: newTrend[index].liked == true
                          ? const Icon(
                              Icons.favorite,
                              color: AppColors.red,
                            )
                          : const Icon(
                              Icons.favorite,
                              color: AppColors.grey,
                            ))),
            ],
          );
        },
      ),
    );
  }
}
