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
    const double imageHeight = 140;

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 6,
            spreadRadius: 0.5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🔹 Image principale
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
              child: Image.asset(
                image,
                width: cardWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),

            // 🔹 Section infos
            Container(
              width: cardWidth,
              constraints: const BoxConstraints(
                minHeight: 0,
                maxHeight: double.infinity,
              ),
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
                border: Border.all(
                  color: Colors.grey.shade100,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 🌸 Petit tag
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: tagColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      tagText,
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: tagTextColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  // 🖤 Titre
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      height: 1.1,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 2),

                  // 🤎 Sous-titre
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.brown.shade700,
                      height: 1.1,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 6),

                  // 📝 Description et icône
                  SizedBox(
                    height: 32,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Texte de description
                        Expanded(
                          child: Text(
                            description,
                            style: TextStyle(
                              fontSize: 9.5,
                              color: Colors.grey.shade700,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const SizedBox(width: 4),

                        // Icône
                        Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              bottomIcon,
                              width: 14,
                              height: 14,
                              colorFilter: ColorFilter.mode(
                                Colors.grey.shade800,
                                BlendMode.srcIn,
                              ),
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
