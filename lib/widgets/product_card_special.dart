import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCardSpecial extends StatelessWidget {
  final String image;
  final String overlayImage;
  final String smallText;
  final String title;
  final String description;
  final String topRightBadgeText;
  final Color badgeColor;
  final VoidCallback? onTap;

  const ProductCardSpecial({
    super.key,
    required this.image,
    required this.overlayImage,
    required this.smallText,
    required this.title,
    required this.description,
    this.topRightBadgeText = '9',
    this.badgeColor = Colors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const double cardSize = 195.0;
    const double imageHeight = cardSize * 0.65;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardSize,
        height: cardSize,
        decoration: BoxDecoration(
          color: const Color(0xFFFFF59D),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                _buildImageSection(),
                _buildContentSection(),
              ],
            ),
            _buildTopRightBadge(),
            _buildOverlayImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    const double cardSize = 195.0;
    const double imageHeight = cardSize * 0.65;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(6),
        topRight: Radius.circular(6),
      ),
      child: Image.asset(
        image,
        width: cardSize,
        height: imageHeight,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildContentSection() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFF59D),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(6),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    smallText,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                        letterSpacing: -0.3,
                        height: 1.2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.7),
                        height: 1.3,
                        letterSpacing: -0.1,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopRightBadge() {
    return Positioned(
      top: 10,
      right: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: badgeColor,
          border: Border.all(
            color: Colors.black.withOpacity(0.15),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          topRightBadgeText,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
            letterSpacing: -0.2,
          ),
        ),
      ),
    );
  }

  Widget _buildOverlayImage() {
    const double cardSize = 195.0;
    const double imageHeight = cardSize * 0.65;

    return Positioned(
      left: 12,
      top: imageHeight - 16,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(5),
        child: SvgPicture.asset(
          overlayImage,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
