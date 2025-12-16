import 'package:flutter/material.dart';

import '../widgets/image_carousel.dart';
import '../widgets/product_carousel.dart';
import '../widgets/product_card.dart';
import '../widgets/product_card_special.dart';
import '../widgets/button_carousel.dart';
import '../widgets/product_carousel_info_white.dart';
import '../models/product_carousel_info_white_item.dart';

class AccueilPage extends StatelessWidget {
  AccueilPage({super.key});

  final List<String> carouselImages = [
    'assets/Bannier nike.png',
    'assets/Bannier nike bleu.png',
    'assets/Bannier nike rouge.png',
  ];

  final List<ProductCard> products = [
    ProductCard(
      image: 'assets/chassure.png',
      overlayImage: 'assets/chanel-svgrepo-com.svg',
      title: 'Révision moteur',
      subtitle: '120 000 Ar',
      isSponsored: true,
    ),
    ProductCard(
      image: 'assets/chassure.png',
      overlayImage: 'assets/chanel-svgrepo-com.svg',
      title: 'Vidange huile',
      subtitle: '50 000 Ar',
      isSponsored: false,
    ),
    ProductCard(
      image: 'assets/chassure.png',
      overlayImage: 'assets/chanel-svgrepo-com.svg',
      title: 'Batterie',
      subtitle: '80 000 Ar',
      isSponsored: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final buttonItems = [
      ButtonCarouselItem(
        svgAsset: 'assets/chanel-svgrepo-com.svg',
        label: 'Voiture',
        onTap: () => debugPrint('Voiture cliqué'),
      ),
      ButtonCarouselItem(
        svgAsset: 'assets/chanel-svgrepo-com.svg',
        label: 'Moto',
        onTap: () => debugPrint('Moto cliqué'),
      ),
      ButtonCarouselItem(
        svgAsset: 'assets/chanel-svgrepo-com.svg',
        label: 'Bus',
        onTap: () => debugPrint('Bus cliqué'),
      ),
      ButtonCarouselItem(
        svgAsset: 'assets/chanel-svgrepo-com.svg',
        label: 'Camion',
        onTap: () => debugPrint('Camion cliqué'),
      ),
    ];

    // Conversion des ProductCard en ProductCarouselInfoWhiteItem avec couleurs paramétrables
    final List<ProductCarouselInfoWhiteItem> infoWhiteItems =
        products.map((product) {
      return ProductCarouselInfoWhiteItem(
        image: product.image,
        tagText: product.isSponsored ? "Sponsorisé" : "Offre",
        tagColor:
            product.isSponsored ? Colors.pink.shade100 : Colors.blue.shade100,
        tagTextColor:
            product.isSponsored ? Colors.pink.shade800 : Colors.blue.shade800,
        title: product.title,
        subtitle: product.subtitle,
        description: "Découvrez cette offre exceptionnelle !",
        bottomIcon: product.overlayImage,
      );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Carousel principal =====
              ImageCarousel(
                height: 220,
                images: carouselImages,
              ),

              const SizedBox(height: 16),

              // ===== Section offres =====
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Offres à ne pas manquer",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ===== ProductCarouselInfoWhite en haut =====
              ProductCarousel(products: products),

              const SizedBox(height: 20),

              // ===== Séparateur =====
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                height: 1,
                color: Colors.grey.shade300,
              ),

              const SizedBox(height: 20),

              // ===== Dernière chance =====
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Dernière chance",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => debugPrint("Voir toutes les offres cliqué"),
                      child: Row(
                        children: const [
                          Text(
                            "Voir tout",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_forward_ios, size: 14),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // ===== ProductCardSpecial horizontal =====
              SizedBox(
                height: 220,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return ProductCardSpecial(
                      image: carouselImages[index],
                      overlayImage: 'assets/chanel-svgrepo-com.svg',
                      smallText: 'Promo',
                      title: index == 0
                          ? 'Chaussure Nike Air'
                          : 'Chaussure Nike Bleu',
                      description: index == 0
                          ? 'Dernière chance de l\'avoir à ce prix'
                          : 'Plus que quelques pièces disponibles',
                      topRightBadgeText: '9 dispo',
                      badgeColor: Colors.white,
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              // ===== Boutons catégorie =====
              ButtonCarousel(
                items: buttonItems,
                multiSelect: false,
              ),

              const SizedBox(height: 24),

              // ===== ProductCarouselInfoWhite placé en bas =====
              ProductCarouselInfoWhite(
                items: infoWhiteItems,
                height: 260,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
