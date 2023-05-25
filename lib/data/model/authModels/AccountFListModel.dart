import 'package:flutter/cupertino.dart';

class AccountFListModel {
  IconData leadingIcon;
  String text;
  Function() onTap;
  AccountFListModel({
    required this.leadingIcon,
    required this.text,
    required this.onTap,
  });
}
