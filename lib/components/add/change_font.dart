import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:post_comments/components/custom_font.dart';
import 'package:post_comments/cubit/add/font_cubit.dart';

class ChangeFont extends StatelessWidget {
  const ChangeFont({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        height: screenSize.height * 0.37,
        width: screenSize.width,
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<FontCubit, String>(
          builder: (BuildContext context, state) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textFontItem(context, "Poppins", state == "Poppins"),
                  const Gap(10),
                  _textFontItem(context, "Lato", state == "Lato"),
                  const Gap(10),
                  _textFontItem(context, "Roboto", state == "Roboto"),
                  const Gap(10),
                  _textFontItem(
                      context, "JetBrainsMono", state == "JetBrainsMono"),
                  const Gap(10),
                  _textFontItem(context, "Montserrat", state == "Montserrat"),
                  const Gap(10),
                  _textFontItem(
                      context, "Merriweather", state == "Merriweather"),
                  const Gap(10),
                  _textFontItem(context, "Oswald", state == "Oswald"),
                ],
              ),
            );
          },
        ));
  }

  Widget _textFontItem(BuildContext context, String font, bool isSelected) {
    return InkWell(
      onTap: () {
        context.read<FontCubit>().change(font);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          font,
          style: CustomFont.getFont(
              font: font,
              color: isSelected ? Colors.white : Colors.black45,
              size: 15),
        ),
      ),
    );
  }
}
