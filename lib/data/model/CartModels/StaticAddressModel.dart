import 'package:flutter/material.dart';

class StaticAddressModel {
  final String title;
  final IconData icon;
  StaticAddressModel({required this.title, required this.icon});
}

class AddressCartModel {
  final String title;
  bool isSelected;
  AddressCartModel({required this.title, required this.isSelected});
}
