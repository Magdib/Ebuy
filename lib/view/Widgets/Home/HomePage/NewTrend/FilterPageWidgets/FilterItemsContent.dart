import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/theme/theme.dart';
import '../../../../../../data/dataSource/Static/static.dart';
import 'FilterDialogContent.dart';

class FilterItemsContent extends StatelessWidget {
  const FilterItemsContent({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.type,
  }) : super(key: key);

  final String title;
  final String type;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextButton(
              onPressed: onPressed,
              child: Text(
                type,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 14),
              ))
        ],
      ),
    );
  }
}
