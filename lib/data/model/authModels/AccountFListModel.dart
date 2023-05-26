import 'package:flutter/cupertino.dart';

class AccountFListModel {
  IconData? leadingIcon;
  String text;
  Function() onTap;
  AccountFListModel({
    this.leadingIcon,
    required this.text,
    required this.onTap,
  });
}
