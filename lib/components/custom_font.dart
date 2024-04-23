import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFont {
  static TextStyle getFont({required String font, Color? color, double? size}) {
    switch (font) {
      case 'Lato':
        return GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: size, color: color, fontWeight: FontWeight.w500));
      case 'Poppins':
        return GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: size, color: color, fontWeight: FontWeight.w500));
      case 'Roboto':
        return GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: size, color: color, fontWeight: FontWeight.w500));
      case 'JetBrainsMono':
        return GoogleFonts.jetBrainsMono(
            textStyle: TextStyle(
                fontSize: size, color: color, fontWeight: FontWeight.w500));
      case 'Montserrat':
        return GoogleFonts.montserrat(
            textStyle: TextStyle(
                fontSize: size, color: color, fontWeight: FontWeight.w500));
      case 'Merriweather':
        return GoogleFonts.merriweather(
            textStyle: TextStyle(
                fontSize: size, color: color, fontWeight: FontWeight.w500));
      case 'Oswald':
        return GoogleFonts.oswald(
            textStyle: TextStyle(
                fontSize: size, color: color, fontWeight: FontWeight.w500));
      case 'PlayfairDisplay':
        return GoogleFonts.playfairDisplay(
            textStyle: TextStyle(
                fontSize: size, color: color, fontWeight: FontWeight.w500));
      case 'TitilliumWeb':
        return GoogleFonts.titilliumWeb(
            textStyle: TextStyle(
                fontSize: size, color: color, fontWeight: FontWeight.w500));
      case 'Mukta':
        return GoogleFonts.mukta(
            textStyle: TextStyle(
                fontSize: size, color: color, fontWeight: FontWeight.w500));
    }
    return TextStyle(fontSize: size, color: color, fontWeight: FontWeight.w500);
  }
}
