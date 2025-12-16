import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/image_carousel.dart';
import '../widgets/product_carousel.dart';
import '../widgets/product_card.dart';
import '../widgets/product_card_special.dart';

// Nouveau widget ButtonCarousel
class ButtonCarouselItem {
  final String svgAsset;
  final String label;
  final VoidCallback onTap;

  ButtonCarouselItem({
    required this.svgAsset,
    required this.label,
    required this.onTap,
  });
}

class ButtonCarousel extends StatelessWidget {
  final List<ButtonCarouselItem> items;
  final double itemWidth;
  final double itemHeight;
  final double spacing;

  const ButtonCarousel({
    super.key,
    required this.items,
    this.itemWidth = 80,
    this.itemHeight = 100,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(width: spacing),
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: item.onTap,
            child: Container(
              width: itemWidth,
              height: itemHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    item.svgAsset,
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Page principale
class AccueilPage extends StatelessWidget {
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
    // Items pour le carousel de boutons
    final buttonItems = [
      ButtonCarouselItem(
        svgAsset: 'assets/icons/car.svg',
        label: 'Voiture',
        onTap: () => print('Voiture cliqué'),
      ),
      ButtonCarouselItem(
        svgAsset: 'assets/icons/bike.svg',
        label: 'Moto',
        onTap: () => print('Moto cliqué'),
      ),
      ButtonCarouselItem(
        svgAsset: 'assets/icons/bus.svg',
        label: 'Bus',
        onTap: () => print('Bus cliqué'),
      ),
      ButtonCarouselItem(
        svgAsset: 'assets/icons/truck.svg',
        label: 'Camion',
        onTap: () => print('Camion cliqué'),
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Carousel principal
          ImageCarousel(
            height: 220,
            images: carouselImages,
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Offre à ne pas manquer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),
          ProductCarousel(
            products: products,
            cardWidth: 160,
            cardHeight: 200,
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            height: 2,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "Dernière chance",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () => print("Voir toutes les offres cliqué"),
                  child: Row(
                    children: const [
                      Text(
                        "Voir toutes les offres",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.black),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
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
                  title:
                      index == 0 ? 'Chaussure Nike Air' : 'Chaussure Nike Bleu',
                  description: index == 0
                      ? 'Dernière chance de l\'avoir à ce prix'
                      : 'Plus que quelques pièces disponibles',
                  topRightBadgeText: '9 dispo',
                  badgeColor: Colors.white,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          // ===== Nouveau carousel de boutons =====
          ButtonCarousel(items: buttonItems),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
