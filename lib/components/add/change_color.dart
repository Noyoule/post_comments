import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:post_comments/cubit/add/color_cubit.dart';

class ChangeColor extends StatefulWidget {
  bool isKeyboardVisible;
  ChangeColor({super.key, this.isKeyboardVisible=false});

  @override
  State<ChangeColor> createState() => _ChangeColorState();
}

class _ChangeColorState extends State<ChangeColor> {
  @override
  Widget build(BuildContext context) {
    return widget.isKeyboardVisible?
    Container(
      height: 70,
      padding: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCircle(context, const Color(0xFF00FF00),widget.isKeyboardVisible),
            const Gap(10),
            _buildCircle(context, const Color(0xFF0000FF),widget.isKeyboardVisible),
            const Gap(10),
            _buildCircle(context, const Color(0xFFFF00FF),widget.isKeyboardVisible),
            const Gap(10),
            _buildCircle(context, const Color(0xFFFFFF00),widget.isKeyboardVisible),
            const Gap(10),
            _buildCircle(context, const Color(0xFF00FFFF),widget.isKeyboardVisible),
            const Gap(10),
            _buildCircle(context, const Color(0xFF800080),widget.isKeyboardVisible),
            const Gap(10),
            _buildCircle(context, const Color(0xFFFFA500),widget.isKeyboardVisible),
            const Gap(10),
            _buildCircle(context, const Color(0xFFA52A2A),widget.isKeyboardVisible),
            const Gap(10),
            _buildCircle(context, const Color(0xFF808080),widget.isKeyboardVisible),
            const Gap(10),
            _buildCircle(context, const Color(0xFF000000),widget.isKeyboardVisible),
            const Gap(10),
            _buildCircle(context, const Color(0xFFFFFFFF),widget.isKeyboardVisible),
            const Gap(10),
          ],
        ),
      ),
    )
        : Container(
      height: 300,
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          _buildCircle(context, const Color(0xFF00FF00),widget.isKeyboardVisible ), // Vert
          _buildCircle(context, const Color(0xFF0000FF),widget.isKeyboardVisible), // Bleu
          _buildCircle(context, const Color(0xFFFF00FF),widget.isKeyboardVisible), // Rose
          _buildCircle(context, const Color(0xFFFFFF00),widget.isKeyboardVisible), // Jaune
          _buildCircle(context, const Color(0xFF00FFFF),widget.isKeyboardVisible), // Cyan
          _buildCircle(context, const Color(0xFF800080),widget.isKeyboardVisible), // Pourpre
          _buildCircle(context, const Color(0xFFFFA500),widget.isKeyboardVisible), // Orange
          _buildCircle(context, const Color(0xFFA52A2A),widget.isKeyboardVisible), // Brun
          _buildCircle(context, const Color(0xFF808080),widget.isKeyboardVisible), // Gris
          _buildCircle(context, const Color(0xFF000000),widget.isKeyboardVisible), // Noir
          _buildCircle(context, const Color(0xFFFFFFFF),widget.isKeyboardVisible), // Blanc
        ],
      ),
    );
  }

  Widget _buildCircle(BuildContext context, Color color, bool isKeyboardVisible) {
    return InkWell(
      onTap: () {
        context.read<ColorCubit>().change(color.value);
      },
      child: Container(
        height: isKeyboardVisible? 40: null,
        width: isKeyboardVisible? 40: null,
        decoration: BoxDecoration(
          shape: isKeyboardVisible? BoxShape.rectangle: BoxShape.circle,
          border: !isKeyboardVisible? Border.all(color: Colors.black38, width: 2): null,
          borderRadius:isKeyboardVisible?  BorderRadius.circular(10): null,
          color: color,
        ),
      ),
    );
  }
}
