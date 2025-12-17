import 'package:flutter/material.dart';

class ButtonCarouselItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  bool isSelected;

  ButtonCarouselItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });
}

class ButtonCarousel extends StatefulWidget {
  final List<ButtonCarouselItem> items;
  final double itemWidth;
  final double itemHeight;
  final double spacing;
  final bool multiSelect;

  const ButtonCarousel({
    super.key,
    required this.items,
    this.itemWidth = 120,
    this.itemHeight = 30,
    this.spacing = 12,
    this.multiSelect = false,
  });

  @override
  State<ButtonCarousel> createState() => _ButtonCarouselState();
}

class _ButtonCarouselState extends State<ButtonCarousel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.itemHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: widget.items.length,
        separatorBuilder: (_, __) => SizedBox(width: widget.spacing),
        itemBuilder: (context, index) {
          final item = widget.items[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                if (widget.multiSelect) {
                  item.isSelected = !item.isSelected;
                } else {
                  for (var i = 0; i < widget.items.length; i++) {
                    widget.items[i].isSelected = i == index;
                  }
                }
              });
              item.onTap();
            },
            child: Container(
              width: widget.itemWidth,
              height: widget.itemHeight,
              decoration: BoxDecoration(
                color: item.isSelected ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: item.isSelected ? Colors.black : Colors.grey.shade300,
                  width: item.isSelected ? 2 : 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    size: 18,
                    color: item.isSelected ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: item.isSelected ? Colors.white : Colors.black,
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
