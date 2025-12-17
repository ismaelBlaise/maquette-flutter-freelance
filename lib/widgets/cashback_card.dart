import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CashbackCard extends StatelessWidget {

  final String image;
  final String percentage;
  final bool featured;

  const CashbackCard({super.key, required this.image, required this.percentage, required this.featured});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
        border: featured
            ? Border.all(color: Colors.black, width: 1)
            : Border.all(color: Colors.transparent, width: 1),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 7,bottom: 10),
                child: Text(
                  percentage,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 6,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
              )
            ],
          ),
          // Logo de la marque
          Container(
            height: 30,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SvgPicture.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomPaint(
              size: const Size(double.infinity, 1),
              painter: DashedLinePainter(),
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Cashbacks',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w900,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            decoration: BoxDecoration(
              color: const Color(0xFFFF4444),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  percentage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(width: 4),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 5,
                  child: Icon(
                    weight: 5,
                    Icons.arrow_upward,
                    color: Colors.red,
                    size: 7,
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }

}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 5.0;
    const dashSpace = 5.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

