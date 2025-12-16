import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/Tracé 9561.svg",
            width: 28,
            height: 28,
          ),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/Tracé 10573.svg",
            width: 28,
            height: 28,
          ),
          label: 'Découvrir',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/fi-rr-shopping-cart.svg",
            width: 28,
            height: 28,
          ),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/fi-rr-usd-circle.svg",
            width: 28,
            height: 28,
          ),
          label: 'Offres',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/fi-rr-circle-user.svg",
            width: 28,
            height: 28,
          ),
          label: 'Compte',
        ),
      ],
    );
  }
}
