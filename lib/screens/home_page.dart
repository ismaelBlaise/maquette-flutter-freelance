import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/app_header.dart';
import 'accueil_page.dart';
import 'decouvrir_page.dart';
import 'shop_page.dart';
import 'offres_page.dart';
import 'compte_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    AccueilPage(),
    DecouvrirPage(),
    ShopPage(),
    OffresPage(),
    ComptePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        iconAsset: 'assets/Groupe 9241.svg',
        onMenuTap: () {
          print("Burger menu cliqué");
        },
        onSearchTap: () {
          print("Recherche cliquée");
        },
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
