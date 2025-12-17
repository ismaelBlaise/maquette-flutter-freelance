import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {

  final String image;
  final String name;
  final String description;

  const ServiceCard({super.key, required this.image, required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 5,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,style:  const TextStyle(fontWeight: FontWeight.w800, fontSize: 13),),
              const Spacer(),
              const Text('Détails', style:  TextStyle(fontWeight: FontWeight.w700, fontSize: 12,color: Colors.black38),),
              const Icon(Icons.keyboard_arrow_down,color: Colors.black38,)
            ],
          ),
          Text(description, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),)
        ],
      ),
    );
  }
}
