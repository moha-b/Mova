import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mova/core/resources/colors.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: ColorPalette.darkPrimary,
  scaffoldBackgroundColor: ColorPalette.darkBackground,
  colorScheme: ColorScheme.fromSwatch(accentColor: ColorPalette.darkAccent),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.roboto(
        fontSize: 40.sp,
        color: ColorPalette.darkPrimary,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    displayMedium: GoogleFonts.roboto(
        fontSize: 35.sp,
        color: ColorPalette.darkPrimary,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    displaySmall: GoogleFonts.roboto(
        fontSize: 30.sp,
        color: ColorPalette.darkPrimary,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    bodyLarge: GoogleFonts.roboto(
        fontSize: 25.sp,
        color: Colors.white,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    bodyMedium: GoogleFonts.roboto(
        fontSize: 20.sp,
        color: Colors.white,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    bodySmall: GoogleFonts.roboto(
        fontSize: 15.sp,
        color: Colors.white,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
  ),
);
