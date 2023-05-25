import 'package:ebuy/Controller/authControllers/SignUpController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/Colors.dart';

import '../../../../../core/theme/theme.dart';
import '../../../../../data/dataSource/Static/UINumbers.dart';

class CustomTextFromFieldWithUpperText extends GetView<SignUpControllerImp> {
  const CustomTextFromFieldWithUpperText({
    Key? key,
    this.onChanged,
    required this.label,
    required this.hint,
    required this.obscure,
    required this.textEditingController,
    required this.validator,
  }) : super(key: key);
  final String label;
  final String hint;
  final bool obscure;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
            style: Theme.of(context).textTheme.bodyText1,
            onChanged: onChanged,
            validator: validator,
            controller: textEditingController,
            obscureText: obscure,
            cursorColor: AppColors.deepGrey,
            decoration: InputDecoration(
                hintStyle: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 16),
                hintText: hint,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(UINumber.borderRadius)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.deepGrey),
                    borderRadius:
                        BorderRadius.circular(UINumber.borderRadius)))),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
