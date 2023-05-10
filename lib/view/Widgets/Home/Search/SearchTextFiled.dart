import 'package:flutter/material.dart';

import '../../../../core/constant/Colors.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
            ),
            suffixIcon: const Icon(
              Icons.camera_alt,
              color: AppColors.deepGrey,
            ),
            prefixIconColor: AppColors.primaryColor,
            hintText: "Search",
            filled: true,
            fillColor: AppColors.veryLightGrey,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
