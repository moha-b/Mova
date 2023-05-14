import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/colors.dart';

ThemeData creamTheme = ThemeData(
  primaryColor: ColorPalette.creamPrimary,
  scaffoldBackgroundColor: ColorPalette.creamBackground,
  appBarTheme: const AppBarTheme(
    foregroundColor: ColorPalette.creamSecondary,
    backgroundColor: ColorPalette.creamBackground,
    actionsIconTheme: IconThemeData(
      color: ColorPalette.creamSecondary,
    ),
    iconTheme: IconThemeData(
      color: ColorPalette.creamSecondary,
    ),
    elevation: 0,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.nunito(
        fontSize: 35,
        fontWeight: FontWeight.w300,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    displayMedium: GoogleFonts.nunito(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    displaySmall: GoogleFonts.nunito(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    bodyLarge: GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    bodyMedium: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: ColorPalette.darkPrimary,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    bodySmall: GoogleFonts.nunito(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    labelSmall: GoogleFonts.nunito(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: ColorPalette.creamForeground,
    onBackground: Colors.black,
  ),
);
