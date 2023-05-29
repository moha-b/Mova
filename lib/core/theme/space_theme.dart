import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mova/core/resources/colors.dart';

ThemeData spaceTheme = ThemeData(
  primaryColor: ColorPalette.spacePrimary,
  scaffoldBackgroundColor: ColorPalette.spaceBackground,
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.white,
    backgroundColor: ColorPalette.spaceBackground,
    actionsIconTheme: IconThemeData(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.transparent,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: ColorPalette.spaceForeground,
    onPrimary: ColorPalette.spaceSecondary,
    onBackground: Colors.white,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.nunito(
      fontSize: 35,
      fontWeight: FontWeight.w300,
      color: ColorPalette.spacePrimary,
    ),
    displayMedium: GoogleFonts.nunito(
      fontSize: 30,
      fontWeight: FontWeight.w300,
      color: ColorPalette.spacePrimary,
    ),
    displaySmall: GoogleFonts.nunito(
      fontSize: 25,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: ColorPalette.spacePrimary,
    ),
    bodyMedium: GoogleFonts.nunito(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.nunito(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelLarge: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: ColorPalette.spacePrimary,
    ),
    labelSmall: GoogleFonts.nunito(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: ColorPalette.spacePrimary,
    ),
  ),
);
