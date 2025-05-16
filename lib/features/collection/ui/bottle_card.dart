import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/bottle.dart';

class BottleCard extends StatelessWidget {
  final Bottle bottle;

  const BottleCard({super.key, required this.bottle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF13212F),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: 'bottle-${bottle.id}', // Make tag globally unique
                child: Image.asset(bottle.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            bottle.name,
            style: GoogleFonts.playfairDisplay(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            '${bottle.year} #${bottle.id}',
            style: const TextStyle(fontSize: 13, color: Colors.white),
          ),
          const Text(
            '(112/158)',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
