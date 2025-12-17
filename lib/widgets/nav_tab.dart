import 'package:flutter/material.dart';

class NavTab extends StatefulWidget {
  final String title;
  final int index;

  const NavTab({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  State<NavTab> createState() => _NavTabState();
}

class _NavTabState extends State<NavTab> {
  static int selectedTab = 0;

  bool get isSelected => selectedTab == widget.index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = widget.index;
        });
      },
      child: Column(
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          if (isSelected)
            Container(
              height: 3,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }
}
