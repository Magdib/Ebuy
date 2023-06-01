import 'package:flutter/material.dart';

AppBar customAppBar(
  String title,
  BuildContext context,
  double elevation, [
  bool automaticallyImplyLeading = true,
]) {
  return AppBar(
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
    ),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    centerTitle: true,
    automaticallyImplyLeading: automaticallyImplyLeading,
    elevation: elevation,
  );
}
