import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String iconAsset;
  final VoidCallback? onMenuTap;
  final VoidCallback? onSearchTap;

  const AppHeader({
    super.key,
    required this.iconAsset,
    this.onMenuTap,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,

      // 🔹 ICON À LA PLACE DU TITRE
      title: SvgPicture.asset(
        iconAsset,
        width: 32,
        height: 32,
      ),
      centerTitle: false,

      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black, size: 32),
          onPressed: onSearchTap,
        ),
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.black, size: 32),
          onPressed: onMenuTap,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
