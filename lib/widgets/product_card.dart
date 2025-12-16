import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  final String image; // Image depuis assets
  final String overlayImage; // Image superposée en bas gauche (SVG)
  final String title; // Texte principal noir
  final String subtitle; // Texte orange
  final bool isSponsored; // Sponsorisé ou pas

  const ProductCard({
    super.key,
    required this.image,
    required this.overlayImage,
    required this.title,
    required this.subtitle,
    this.isSponsored = false,
  });

  @override
  Widget build(BuildContext context) {
    double cardSize = 160;
    double cardHeight = 200;
    return Container(
      width: cardSize,
      height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100, // fond gris clair
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image avec image superposée
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  image,
                  width: cardSize,
                  height: cardSize * 0.75,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6), // petit radius
                    child: Padding(
                      padding: const EdgeInsets.all(
                          2), // pour que l'image ne touche pas les bords
                      child: SvgPicture.asset(
                        overlayImage,
                        fit: BoxFit.contain, // <-- l'image reste dans le cadre
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                if (isSponsored)
                  const Icon(
                    Icons.error_outline,
                    size: 12,
                    color: Colors.grey,
                  ),
                if (isSponsored) const SizedBox(width: 4),
                Text(
                  isSponsored ? 'Sponsorisé' : '',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
