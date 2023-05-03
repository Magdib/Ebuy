import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';

class SeeAllTextRow extends StatelessWidget {
  const SeeAllTextRow({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final void Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            'See all',
            style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 12),
          ),
        )
      ],
    );
  }
}
