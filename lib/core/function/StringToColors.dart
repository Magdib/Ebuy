import 'package:ebuy/core/constant/Colors.dart';
import 'package:flutter/material.dart';

Color stringToColor(String colorname) {
  late Color color;
  switch (colorname) {
    case "Black":
      color = AppColors.black;
      break;
    case "Beige":
      color = AppColors.beige;
      break;
    case "Blue":
      color = AppColors.blue;
      break;
    case "Brown":
      color = AppColors.primaryColor;
      break;
    case "Cyan":
      color = AppColors.cyan;
      break;
    case "Green":
      color = AppColors.green;
      break;
    case "Grey":
      color = AppColors.grey;
      break;
    case "Orange":
      color = AppColors.orange;
      break;
    case "Red":
      color = AppColors.red;
      break;
    case "Yellow":
      color = AppColors.yellow;
      break;
    default:
      color = AppColors.black;
  }
  return color;
}
