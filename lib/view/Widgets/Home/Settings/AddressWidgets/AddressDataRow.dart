import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';

class AddressDataRow extends StatelessWidget {
  const AddressDataRow({
    super.key,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.grey,
        ),
        const SizedBox(
          width: 10,
        ),
        FittedBox(
          child: SizedBox(
            width: UINumber.deviceWidth / 1.5,
            child: Text(
              title,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
            ),
          ),
        )
      ],
    );
  }
}
