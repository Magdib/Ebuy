import 'package:flutter/material.dart';

class TProducts {
  final String title, subtitle, image, category;
  bool liked, disliked;
  final int price;
  final Color color;
  final String? size;
  TProducts(
      {required this.title,
      required this.subtitle,
      required this.image,
      required this.liked,
      required this.disliked,
      required this.price,
      required this.category,
      required this.color,
      required this.size});
}
