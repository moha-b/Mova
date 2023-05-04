import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/colors.dart';

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    displayLarge: GoogleFonts.nunito(
        fontSize: 35.sp,
        fontWeight: FontWeight.w300,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    displayMedium: GoogleFonts.nunito(
        fontSize: 30.sp,
        fontWeight: FontWeight.w600,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    displaySmall: GoogleFonts.nunito(
        fontSize: 25.sp,
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
);
