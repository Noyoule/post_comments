import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_comments/cubit/add/color_cubit.dart';

class ChangeColor extends StatefulWidget {
  const ChangeColor({super.key});

  @override
  State<ChangeColor> createState() => _ChangeColorState();
}

class _ChangeColorState extends State<ChangeColor> {
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
          _buildCircle(context, const Color(0xFF00FF00)), // Vert
          _buildCircle(context, const Color(0xFF0000FF)), // Bleu
          _buildCircle(context, const Color(0xFFFF00FF)), // Rose
          _buildCircle(context, const Color(0xFFFFFF00)), // Jaune
          _buildCircle(context, const Color(0xFF00FFFF)), // Cyan
          _buildCircle(context, const Color(0xFF800080)), // Pourpre
          _buildCircle(context, const Color(0xFFFFA500)), // Orange
          _buildCircle(context, const Color(0xFFA52A2A)), // Brun
          _buildCircle(context, const Color(0xFF808080)), // Gris
          _buildCircle(context, const Color(0xFF000000)), // Noir
          _buildCircle(context, const Color(0xFFFFFFFF)), // Blanc
        ],
      ),
    );
  }

  Widget _buildCircle(BuildContext context, Color color) {
    return InkWell(
      onTap: () {
        context.read<ColorCubit>().change(color.value);
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black38, width: 2),
          color: color,
        ),
      ),
    );
  }
}
