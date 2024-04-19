import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChangeColor extends StatelessWidget {
  const ChangeColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          _buildCircle(const Color(0xFF00FF00)), // Vert
          _buildCircle(const Color(0xFF0000FF)), // Bleu
          _buildCircle(const Color(0xFFFF00FF)), // Rose
          _buildCircle(const Color(0xFFFFFF00)), // Jaune
          _buildCircle(const Color(0xFF00FFFF)), // Cyan
          _buildCircle(const Color(0xFF800080)), // Pourpre
          _buildCircle(const Color(0xFFFFA500)), // Orange
          _buildCircle(const Color(0xFFA52A2A)), // Brun
          _buildCircle(const Color(0xFF808080)), // Gris
        ],
      ),
    );
  }

  Widget _buildCircle(Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
