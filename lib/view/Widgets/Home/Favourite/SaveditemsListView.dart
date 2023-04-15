import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/Colors.dart';

import '../../../../core/theme/theme.dart';
import '../../../../data/dataSource/Static/UINumbers.dart';
import '../../../../data/dataSource/Static/static.dart';

class SaveditemsListView extends StatelessWidget {
  const SaveditemsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 180,
        itemCount: savedItems.length,
        itemBuilder: (context, index) => Stack(
              children: [
                SizedBox(
                    height: 160,
                    width: UINumber.deviceWidth,
                    child: Card(
                      elevation: 10,
                      margin:
                          const EdgeInsets.only(top: 20, left: 46, right: 5),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: UINumber.deviceWidth / 1.7, top: 85),
                        child: IconButton(
                            splashRadius: 14,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: AppColors.grey,
                            )),
                      ),
                    )),
                SizedBox(
                  height: 170,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(
                        savedItems[index].image,
                        height: 85,
                        width: 87,
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
                            savedItems[index].title,
                            style: AppTheme.arabicTheme.textTheme.bodyText1!
                                .copyWith(fontSize: 16),
                          ),
                          Row(
                            children: [
                              Text(
                                'Color:   ',
                                style: AppTheme.arabicTheme.textTheme.headline6!
                                    .copyWith(fontSize: 14),
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: savedItems[index].color),
                              )
                            ],
                          ),
                          Visibility(
                            replacement: const SizedBox(
                              height: 15,
                            ),
                            visible:
                                savedItems[index].size != null ? true : false,
                            child: Text(
                              'Size:  XL',
                              style: AppTheme.arabicTheme.textTheme.headline6!
                                  .copyWith(fontSize: 14),
                            ),
                          ),
                          Text(
                            '\$${savedItems[index].price}',
                            style: AppTheme.arabicTheme.textTheme.bodyText1!
                                .copyWith(fontSize: 18),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ));
  }
}
