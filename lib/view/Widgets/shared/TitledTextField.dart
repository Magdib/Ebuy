import 'package:ebuy/Controller/authControllers/SignUpController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/Colors.dart';

import '../../../core/theme/theme.dart';
import '../../../data/dataSource/Static/UINumbers.dart';

class TitledTextField extends GetView<SignUpControllerImp> {
  const TitledTextField({
    Key? key,
    this.onChanged,
    required this.label,
    required this.hint,
    this.obscure = false,
    required this.textEditingController,
    this.validator,
    this.keyboardType,
  }) : super(key: key);
  final String label;
  final String hint;
  final bool? obscure;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
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
            obscureText: obscure!,
            cursorColor: AppColors.deepGrey,
            keyboardType: keyboardType,
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
