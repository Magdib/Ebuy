import 'package:ebuy/Controller/Home/SearchController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/Colors.dart';

class SearchTextFiled extends GetView<SearchControllerImp> {
  const SearchTextFiled({
    super.key,
    this.onTap,
    required this.readOnly,
  });
  final void Function()? onTap;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 50,
        child: TextField(
          onTap: onTap,
          readOnly: readOnly,
          autofocus: true,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
          cursorColor: AppColors.primaryColor,
          controller: controller.searchController,
          onChanged: (value) {
            if (value.isNotEmpty) {
              controller.searchingProducts();
              controller.changeSearchState(2);
            } else {
              controller.changeSearchState(1);
            }
          },
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
              ),
              suffixIcon: IconButton(
                onPressed: () => controller.changeSearchState(1),
                icon: Icon(
                  Icons.circle,
                  color: AppColors.deepGrey,
                ),
              ),
              prefixIconColor: AppColors.primaryColor,
              hintText: "Search",
              filled: true,
              fillColor: AppColors.veryLightGrey,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
