import 'package:flutter/material.dart';
import 'package:myapp/widgets/share_and_win.dart';

import '../widgets/cashback_card.dart';
import '../widgets/image_carousel.dart';
import '../widgets/nav_tab.dart';
import '../widgets/product_carousel.dart';
import '../widgets/product_card.dart';
import '../widgets/product_card_special.dart';
import '../widgets/button_carousel.dart';
import '../widgets/product_carousel_info_white.dart';
import '../models/product_carousel_info_white_item.dart';
import '../widgets/service_card.dart';

class AccueilPage extends StatelessWidget {
  AccueilPage({super.key});

  final List<String> carouselImages = [
    'assets/Bannier nike rouge.png',
    'assets/Bannier nike.png',
    'assets/Bannier nike bleu.png',
  ];
  final List<Map<String, dynamic>> _productCardData = [
    {
      'image': 'assets/chassure.png',
      'overlayImage': 'assets/chanel-svgrepo-com.svg',
      'title': 'Dès 20€ d\'achat',
      'subtitle': 'LIVRAISON OFFERTE',
      'isSponsored': true,
    },
    {
      'image': 'assets/Nike Gris.png',
      'overlayImage': 'assets/nike-6.svg',
      'title': '10 € offerts',
      'subtitle': 'BON D\'ACHAT',
      'isSponsored': false,
    },
    {
      'image': 'assets/moucassins.png',
      'overlayImage': 'assets/Tracé 10559.svg',
      'title': 'Dès 20€ d\'achat',
      'subtitle': 'LIVRAISON OFFERTE',
      'isSponsored': true,
    },
  ];

  // ===== DONNÉES PRODUCT CARD SPECIAL =====
  final Color _specialBadgeColor = Colors.white;

  final List<Map<String, dynamic>> _specialCardData1 = [
    {
      'image': 'assets/NIKDS.png',
      'title': 'Chaussures, Jusqu\'à -60% !',
      'description': 'Des chaussures tendance à prix réduit',
      'smalltext': 'VENTE FLASH',
      'overlayImage': 'assets/nike-6.svg',
      'topRightBadgeText': 'Plus que 8 dispos',
    },
    {
      'image': 'assets/nk.png',
      'title': 'Cashback X2 Aujourd\'hui',
      'smalltext': 'HAPPY HOURS',
      'description': 'Achetez vos chaussures et récupérez',
      'overlayImage': 'assets/nike-6.svg',
      'topRightBadgeText': 'Plus que 8 dispos',
    },
  ];

  // ===== DONNÉES PRODUCT CAROUSEL INFO WHITE =====
  final List<Map<String, dynamic>> _infoWhiteItemsData1 = [
    {
      'image': 'assets/IPhone.png',
      'overlayImage': 'assets/apple-[#173].svg',
      'title': 'Jusqu\'à 7,5 % de cashback',
      'subtitle': 'À Remboursés',
      'tagText': 'High-Tech',
      'tagColor': Colors.pink.shade100,
      'tagTextColor': Colors.black,
      'description': 'au lieu de 5%',
    },
    {
      'image': 'assets/mackbook.png',
      'overlayImage': 'assets/apple-[#173].svg',
      'title': 'Cashback jusqu\'à 9,5 %',
      'subtitle': 'À Remboursés',
      'tagText': 'High-Tech',
      'tagColor': Colors.pink.shade100,
      'tagTextColor': Colors.black,
      'description': 'au lieu de 7%',
    },
    {
      'image': 'assets/Costume noir.png',
      'overlayImage': 'assets/Tracé 10559.svg',
      'title': 'Jusqu\'à 7,5 % de cashback',
      'subtitle': 'LIVRAISON OFFERTE',
      'tagText': 'Mode & accessoires',
      'tagColor': Colors.yellow.shade300,
      'tagTextColor': Colors.black,
      'description': 'Découvrez cette offre exceptionnelle !',
    },
  ];

  final List<Map<String, dynamic>> _infoWhiteItemsData2 = [
    {
      'image': 'assets/Casque.png',
      'overlayImage': 'assets/jbl-svgrepo-com.svg',
      'title': 'Cashback 12 % Premium',
      'subtitle': 'À Remboursés',
      'tagText': 'High-Tech',
      'tagColor': Colors.pink.shade100,
      'tagTextColor': Colors.black,
      'description': 'au lieu de 9%',
    },
    {
      'image': 'assets/Montre.png',
      'overlayImage': 'assets/apple-[#173].svg',
      'title': 'Jusqu\'à 5,5 % Today',
      'subtitle': 'À Remboursés',
      'tagText': 'High-Tech',
      'tagColor': Colors.pink.shade100,
      'tagTextColor': Colors.black,
      'description': 'au lieu de 3%',
    },
    {
      'image': 'assets/mous.png',
      'overlayImage': 'assets/Tracé 10559.svg',
      'title': 'Cadeau Offert',
      'subtitle': 'AVEC 100€ D\'ACHAT',
      'tagText': 'High-Tech',
      'tagColor': Colors.yellow.shade300,
      'tagTextColor': Colors.black,
      'description': 'Recevez un cadeau surprise pour 100€ d\'achat',
    },
  ];

  final List<Map<String, dynamic>> cashbacks = [
    {'image': 'assets/gucci-4.svg', 'percentage': '15%', 'featured': false},
    {'image': 'assets/nike-6.svg', 'percentage': '13%', 'featured': false},
    {'image': 'assets/airbnb.svg', 'percentage': '12%', 'featured': false},
    {'image': 'assets/ASUS_logo.svg', 'percentage': '12%', 'featured': false},
    {'image': 'assets/sony-2.svg', 'percentage': '10%', 'featured': false},
    {'image': 'assets/logo-amazon.svg', 'percentage': '9%', 'featured': false},
  ];

  final List<Map<String, dynamic>> services = [
    {
      'image': 'assets/Avis-Logo-1964.png',
      'name': 'Chez Avis',
      'description': "Réduction Avis : jusqu'à -20% sur vos locations en France",
    },
    {
      'image': 'assets/Costume noir.png',
      'name': 'Etienne Services',
      'description': "Etienne Services : les meilleurs artisans plombiers",
    },
    {
      'image': 'assets/Chambre.png',
      'name': 'Udemy',
      'description': "Sélection de cours en ligne gratuits - Django, VBA, Python.",
    },
    {
      'image': 'assets/Télé.png',
      'name': 'Upweb Agency',
      'description': "Je vais créer votre site web vitrine WordPress optimisé SEO.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final List<ProductCard> products = _productCardData.map((data) {
      return ProductCard(
        image: data['image'] as String,
        overlayImage: data['overlayImage'] as String,
        title: data['title'] as String,
        subtitle: data['subtitle'] as String,
        isSponsored: data['isSponsored'] as bool,
      );
    }).toList();

    final buttonItems = [
      ButtonCarouselItem(
        icon: Icons.person_outline,
        label: 'Pour vous',
        onTap: () => debugPrint('Pour vous cliqué'),
      ),
      ButtonCarouselItem(
        icon: Icons.new_releases_outlined,
        label: 'Nouveau',
        onTap: () => debugPrint('Nouveau cliqué'),
      ),
      ButtonCarouselItem(
        icon: Icons.local_offer_outlined,
        label: 'Top deals',
        onTap: () => debugPrint('Top deals cliqué'),
      ),
      ButtonCarouselItem(
        icon: Icons.star_border,
        label: 'En vedettes',
        onTap: () => debugPrint('En vedettes cliqué'),
      ),
    ];

    final List<ProductCarouselInfoWhiteItem> infoWhiteItems1 =
        _infoWhiteItemsData1.map((data) {
      return ProductCarouselInfoWhiteItem(
        image: data['image'] as String,
        tagText: data['tagText'],
        tagColor: data['tagColor'],
        tagTextColor: data['tagTextColor'],
        title: data['title'] as String,
        subtitle: data['subtitle'] as String,
        description: data['description'] as String,
        bottomIcon: data['overlayImage'] as String,
      );
    }).toList();

    final List<ProductCarouselInfoWhiteItem> infoWhiteItems2 =
        _infoWhiteItemsData2.map((data) {
      return ProductCarouselInfoWhiteItem(
        image: data['image'] as String,
        tagText: data['tagText'],
        tagColor: data['tagColor'],
        tagTextColor: data['tagTextColor'],
        title: data['title'] as String,
        subtitle: data['subtitle'] as String,
        description: data['description'] as String,
        bottomIcon: data['overlayImage'] as String,
      );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

              // ===== ProductCarousel =====
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

              // ===== PREMIER ProductCardSpecial horizontal =====
              SizedBox(
                height: 220,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: _specialCardData1.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final cardData = _specialCardData1[index];
                    return ProductCardSpecial(
                      image: cardData['image'] as String,
                      overlayImage: cardData['overlayImage'] as String,
                      smallText: cardData['smalltext'] as String,
                      title: cardData['title'] as String,
                      description: cardData['description'] as String,
                      topRightBadgeText:
                          cardData['topRightBadgeText'] as String,
                      badgeColor: _specialBadgeColor,
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // ===== Boutons catégorie =====
              ButtonCarousel(
                items: buttonItems,
                multiSelect: false,
              ),

              const SizedBox(height: 24),

              // ===== PREMIER ProductCarouselInfoWhite =====
              const SizedBox(height: 12),
              ProductCarouselInfoWhite(
                items: infoWhiteItems1,
                height: 260,
              ),
              ProductCarouselInfoWhite(
                items: infoWhiteItems2,
                height: 260,
              ),

              const SizedBox(height: 24),
              
              // ===== Séparateur =====
              Container(height: 1, color: const Color(0xFFEAE9E9)),
              const SizedBox(height: 24),

              // ===== Navigation Tabs =====
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavTab(title: "TOP CASHBACKS", index: 0),
                  NavTab(title: "TOP CODES PROMO", index: 1),
                  NavTab(title: "TOP PARTENAIRES", index: 2),
                ],
              ),

              const SizedBox(height: 10),

              // ===== Cashback Grid =====
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: cashbacks.length,
                itemBuilder: (context, index) {
                  return CashbackCard(
                    image: cashbacks[index]['image'] as String,
                    percentage: cashbacks[index]['percentage'] as String,
                    featured: cashbacks[index]['featured'] as bool,
                  );
                },
              ),

              const SizedBox(height: 10),

              // ===== Voir toutes les offres =====
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GestureDetector(
                  onTap: () => debugPrint("Voir toutes les offres cliqué"),
                  child: const Row(
                    children: [
                      Text(
                        "Voir toutes les offres",
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
              ),

              const SizedBox(height: 10),

              // ===== Séparateur =====
              const SizedBox(height: 24),
              Container(height: 1, color: const Color(0xFFEAE9E9)),
              const SizedBox(height: 24),

              // ===== Service + Section =====
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Service +",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          debugPrint("Voir tous les services cliqué"),
                      child: const Row(
                        children: [
                          Text(
                            "Voir tous les services",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
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

              // ===== Service Grid =====
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return ServiceCard(
                    image: services[index]['image'] as String,
                    name: services[index]['name'] as String,
                    description: services[index]['description'] as String,
                  );
                },
              ),

              const SizedBox(height: 14),
              
              // ===== Séparateur =====
              Container(height: 1, color: const Color(0xFFEAE9E9)),
              const SizedBox(height: 14),

              // ===== Share and Win =====
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ShareAndWin(),
              ),

              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}