import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCardSpecial extends StatelessWidget {
  final String image; // Image principale depuis assets
  final String overlayImage; // Image superposée en bas gauche (SVG)
  final String
      smallText; // Texte à côté de l'icône (en haut droite de la partie orange)
  final String title; // Titre principal sous l'image
  final String description; // Description en bas
  final String topRightBadgeText; // Badge en haut à droite (ex: "9 disponible")
  final Color badgeColor; // Couleur du badge

  const ProductCardSpecial({
    super.key,
    required this.image,
    required this.overlayImage,
    required this.smallText,
    required this.title,
    required this.description,
    this.topRightBadgeText = '9',
    this.badgeColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    double cardSize = 180;
    double imageHeight = cardSize * 0.6;

    return Container(
      width: cardSize,
      height: cardSize,
      decoration: BoxDecoration(
        color: Colors.yellow.shade300, // fond jaune
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              // Partie supérieure avec image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  image,
                  width: cardSize,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
              // Partie inférieure orange
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade300,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Ligne supérieure: smallText aligné à droite
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            child: Text(
                              smallText,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 4),

                      // Section texte alignée à l'extrême GAUCHE
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft, // Extrême gauche
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                                CrossAxisAlignment.start, // Alignement à gauche
                            children: [
                              // Titre aligné à l'extrême gauche
                              Container(
                                width: double.infinity,
                                child: Text(
                                  title,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign:
                                      TextAlign.left, // Alignement à gauche
                                ),
                              ),

                              const SizedBox(height: 4),

                              // Description alignée à l'extrême gauche
                              Container(
                                width: double.infinity,
                                child: Text(
                                  description,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.black87,
                                    height: 1.2,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign:
                                      TextAlign.left, // Alignement à gauche
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Badge en haut à droite
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: badgeColor,
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                topRightBadgeText,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // OverlayImage seule qui se superpose
          Positioned(
            left: 12,
            top: imageHeight - 14, // Positionné à la transition
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset(
                  overlayImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
