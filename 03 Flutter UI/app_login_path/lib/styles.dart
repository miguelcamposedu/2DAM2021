import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DamStyle {
  // Colors
  static const Color primaryColor = Color(0xFF5C4789);
  static const Color secondaryColor = Color(0xFFEE8B60);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color orangeColor = Color(0xFFE62F16);

  // Margins, Paddings, Card properties
  static const double bodyPadding = 20.0;
  static const double cardElevation = 1.0;
  static const double cardBorderRadius = 15;

  // Font sizes, TextStyles
  static const double textSizeSmall = 14.0;
  static const double textSizeMedium = 28.0;
  static const double textSizeTitle = 40.0;

  static TextStyle get textTitle => GoogleFonts.getFont(
        'Nunito',
        color: DamStyle.orangeColor,
        fontWeight: FontWeight.w600,
        fontSize: 40,
      );

  static TextStyle textTitleCustom(Color c, double fSize) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: fSize,
      );
}
