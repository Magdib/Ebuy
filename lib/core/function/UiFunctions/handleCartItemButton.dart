import 'package:flutter/material.dart';

import '../../class/enums.dart';
import '../../constant/Colors.dart';

handleCartItemButton(CartButtonState cartButtonState, String type) {
  if (cartButtonState == CartButtonState.add) {
    switch (type) {
      case "Color":
        return AppColors.green;
      case "visible":
        return true;
      case "Icon":
        return Icons.check;
      default:
    }
  } else if (cartButtonState == CartButtonState.delete) {
    switch (type) {
      case "Color":
        return AppColors.red;
      case "visible":
        return true;
      case "Icon":
        return Icons.close;
      default:
    }
  } else {
    switch (type) {
      case "Color":
        return AppColors.white;
      case "visible":
        return false;
      case "Icon":
        return Icons.close;
      default:
    }
  }
}
