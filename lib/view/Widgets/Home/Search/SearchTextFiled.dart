import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/Colors.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({
    super.key,
    this.onTap,
    required this.readOnly,
    required this.textController,
    required this.onChanged,
    required this.suffixTap,
  });
  final void Function()? onTap;
  final bool readOnly;
  final TextEditingController textController;
  final void Function(String) onChanged;
  final VoidCallback suffixTap;
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
          controller: textController,
          onChanged: onChanged,
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
              ),
              suffixIcon: IconButton(
                onPressed: suffixTap,
                icon: const Icon(
                  Icons.circle,
                  color: AppColors.deepGrey,
                ),
              ),
              prefixIconColor: AppColors.primaryColor,
              hintText: "Search".tr,
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
