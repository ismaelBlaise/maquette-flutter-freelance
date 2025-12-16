import 'package:flutter/material.dart';

class ProductCarouselInfoWhiteItem {
  final String image;
  final String tagText;
  final Color? tagColor;
  final Color? tagTextColor;
  final String title;
  final String subtitle;
  final String description;
  final String bottomIcon;

  ProductCarouselInfoWhiteItem({
    required this.image,
    required this.tagText,
    this.tagColor,
    this.tagTextColor,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.bottomIcon,
  });
}
