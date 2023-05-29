import 'package:flutter/material.dart';

class CardExpiryWheelList extends StatelessWidget {
  const CardExpiryWheelList({
    required this.startFrom,
    required this.variable,
    required this.onSelectedItemChanged,
    required this.childCount,
    super.key,
  });
  final int startFrom;
  final int variable;
  final void Function(int) onSelectedItemChanged;
  final int childCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 100,
      child: ListWheelScrollView.useDelegate(
          useMagnifier: true,
          itemExtent: 35,
          physics: const BouncingScrollPhysics(),
          onSelectedItemChanged: onSelectedItemChanged,
          childDelegate: ListWheelChildBuilderDelegate(
              childCount: childCount,
              builder: (context, index) => Text(
                    '${index + startFrom}',
                    style: (index + startFrom) == variable
                        ? Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 18)
                        : Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 14),
                  ))),
    );
  }
}
