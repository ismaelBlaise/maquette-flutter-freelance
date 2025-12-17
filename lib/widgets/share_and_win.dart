import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShareAndWin extends StatelessWidget {
  const ShareAndWin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black
      ),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 14,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'Partagez et ',
                      ),
                      TextSpan(
                        text: 'gagnez +',
                        style: TextStyle(
                          color: Color(0xFFF9DE28),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      height: 1.4,
                    ),
                    children: [
                      TextSpan(
                        text: "Invitez d’autres personnes à rejoindre",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                        ),
                      ),
                      TextSpan(
                        text: " ",
                      ),
                      TextSpan(
                        text: "Clickandplus",
                        style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13
                        ),
                      ),
                      TextSpan(
                        text:
                        " et gagnez sur leurs achats des points convertibles en cash ou en ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12
                        ),
                      ),
                      TextSpan(
                        text: "réductions.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  spacing: 8,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF9DE28),
                        minimumSize: const Size(0, 30),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.rotate(
                            angle: -50 * math.pi / 180,
                            child: const Icon(
                              Icons.link,
                              color: Colors.black,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Partager mon lien',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xFFF9DE28),
                          width: 1.5,
                        ),
                        backgroundColor: Colors.black,
                        minimumSize: const Size(0, 30),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'En savoir plus',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),

                  ],
                ),




              ],
            ),
          ),
          Center(
            child: Container(
              width: 100,
              height: 100,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 1,
                    left: 3,
                    child: Transform.rotate(
                      angle: -15 * math.pi / 180,
                      child: SvgPicture.asset(
                        'assets/facebook-svgrepo-com(1).svg',
                        fit: BoxFit.contain,
                        height: 30,
                      )
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 3,
                    child: Transform.rotate(
                        angle: 20 * math.pi / 180,
                        child: SvgPicture.asset(
                          'assets/instagram-2016-logo-svgrepo-com.svg',
                          fit: BoxFit.contain,
                          height: 23,
                        )
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 30,
                    child: Transform.rotate(
                      angle: 0 * math.pi / 180, // 25°
                      child: SvgPicture.asset(
                        'assets/tiktok-svgrepo-com.svg',
                        fit: BoxFit.contain,
                        height: 50,
                      )
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 0,
                    child: Transform.rotate(
                      angle: 0 * math.pi / 180, // 25°
                      child: SvgPicture.asset(
                        'assets/google-svgrepo-com.svg',
                        height: 23,
                        fit: BoxFit.contain,
                      )
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    child: Center(
                      child: Transform.rotate(
                        angle: -10 * math.pi / 180, // -45°
                        child: SvgPicture.asset(
                          'assets/linkedin-color-svgrepo-com.svg',
                          height: 23,
                          fit: BoxFit.contain,
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}
