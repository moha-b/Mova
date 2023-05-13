import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mova/core/resources/colors.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: ColorPalette.darkPrimary,
  scaffoldBackgroundColor: ColorPalette.darkBackground,
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: ColorPalette.darkForeground),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.nunito(
      fontSize: 35,
      fontWeight: FontWeight.w300,
      color: ColorPalette.darkPrimary,
    ),
    displayMedium: GoogleFonts.nunito(
      fontSize: 30,
      fontWeight: FontWeight.w300,
      color: ColorPalette.darkPrimary,
    ),
    displaySmall: GoogleFonts.nunito(
      fontSize: 25,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: ColorPalette.darkPrimary,
    ),
    bodyMedium: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelLarge: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: ColorPalette.darkPrimary,
    ),
    bodySmall: GoogleFonts.nunito(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelSmall: GoogleFonts.nunito(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: ColorPalette.darkPrimary,
    ),
  ),
);
