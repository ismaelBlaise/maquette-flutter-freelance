import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCardInfoWhite extends StatelessWidget {
  final String image;
  final String tagText;
  final Color tagColor;
  final Color tagTextColor;
  final String title;
  final String subtitle;
  final String description;
  final String bottomIcon;
  final VoidCallback? onTap;

  const ProductCardInfoWhite({
    super.key,
    required this.image,
    required this.tagText,
    this.tagColor = const Color(0xFFFFC0CB),
    this.tagTextColor = const Color(0xFF880E4F),
    required this.title,
    required this.subtitle,
    required this.description,
    required this.bottomIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 180;
    const double imageHeight = 110;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // 🔹 Image principale
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
              child: Image.asset(
                image,
                width: cardWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),

            // 🔹 Section infos fond blanc
            Container(
              width: cardWidth,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🌸 Petit card rose
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: tagColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tagText,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: tagTextColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  // 🖤 Gros texte
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  // 🤎 Texte moyen
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.brown,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // 📝 Description et icône en bas
                  SizedBox(
                    height: 40, // hauteur fixe pour que l'icône reste en bas
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 24, // espace pour l'icône
                          top: 0,
                          bottom: 0,
                          child: Text(
                            description,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey.shade700,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: SvgPicture.asset(
                            bottomIcon,
                            width: 18,
                            height: 18,
                            colorFilter: const ColorFilter.mode(
                              Colors.black87,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
