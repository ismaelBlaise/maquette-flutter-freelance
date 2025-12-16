import 'package:flutter/material.dart';
import '../models/product_carousel_info_white_item.dart';
import './product_card_info_white.dart';

class ProductCarouselInfoWhite extends StatelessWidget {
  final List<ProductCarouselInfoWhiteItem> items;
  final double height;

  const ProductCarouselInfoWhite({
    super.key,
    required this.items,
    this.height = 260,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final item = items[index];

          return ProductCardInfoWhite(
            image: item.image,
            tagText: item.tagText,
            tagColor: item.tagColor ?? const Color(0xFFFFC0CB),
            tagTextColor: item.tagTextColor ?? const Color(0xFF880E4F),
            title: item.title,
            subtitle: item.subtitle,
            description: item.description,
            bottomIcon: item.bottomIcon,
            onTap: () {
              debugPrint('Produit cliqué : ${item.title}');
            },
          );
        },
      ),
    );
  }
}
