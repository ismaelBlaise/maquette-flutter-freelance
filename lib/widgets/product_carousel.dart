import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductCarousel extends StatefulWidget {
  final List<ProductCard> products;

  const ProductCarousel({
    super.key,
    required this.products,
  });

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;

  void _onScroll() {
    if (!mounted) return;
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = _getCardWidth(screenWidth);
    final spacing = _getSpacing(screenWidth);

    double offset = _scrollController.offset;
    double itemExtent = cardWidth + spacing;
    int index = (offset / itemExtent).round();

    if (index != _currentIndex &&
        index >= 0 &&
        index < widget.products.length) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  double _getCardWidth(double screenWidth) {
    if (screenWidth < 360) {
      return screenWidth * 0.75;
    } else if (screenWidth < 600) {
      return screenWidth * 0.42;
    } else if (screenWidth < 900) {
      return screenWidth * 0.28;
    } else {
      return 280;
    }
  }

  double _getSpacing(double screenWidth) {
    return screenWidth < 600 ? 12.0 : 16.0;
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = _getCardWidth(screenWidth);
    final cardHeight = cardWidth * 1.4;
    final spacing = _getSpacing(screenWidth);
    final horizontalPadding = screenWidth < 600 ? 16.0 : 24.0;

    return Column(
      children: [
        SizedBox(
          height: cardHeight,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            itemCount: widget.products.length,
            separatorBuilder: (_, __) => SizedBox(width: spacing),
            itemBuilder: (context, index) {
              return SizedBox(
                width: cardWidth,
                child: widget.products[index],
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        _buildPageIndicators(),
      ],
    );
  }

  Widget _buildPageIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.products.length, (index) {
        final isActive = _currentIndex == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.4),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
        );
      }),
    );
  }
}
