import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  final String image; // Image depuis assets
  final String overlayImage; // Image superposée en bas gauche (SVG)
  final String title; // Texte principal noir
  final String subtitle; // Texte orange
  final bool isSponsored; // Sponsorisé ou pas
  final double cardWidth; // Largeur de la carte

  const ProductCard({
    super.key,
    required this.image,
    required this.overlayImage,
    required this.title,
    required this.subtitle,
    this.isSponsored = false,
    this.cardWidth = 160,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.grey.shade100, // fond gris clair
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 7,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Important : s'adapte au contenu
        children: [
          // Image avec image superposée
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
                child: Image.asset(
                  image,
                  width: cardWidth,
                  height:
                      cardWidth * 0.75, // Hauteur proportionnelle à la largeur
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  width: 28,
                  height: 26,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(7)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: SvgPicture.asset(
                        overlayImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Contenu textuel
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Titre
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

                // Sous-titre
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                // Label "Sponsorisé" (toujours en bas)
                if (isSponsored) ...[
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Sponsorisé',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
