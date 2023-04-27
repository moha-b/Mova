import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mova/core/resources/colors.dart';

ThemeData DarkTheme() {
  return ThemeData(
      primaryColor: ColorPalette.darkPrimary,
      scaffoldBackgroundColor: ColorPalette.darkBackground,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: ColorPalette.darkAccent,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.roboto(
            fontSize: 30.sp,
            color: ColorPalette.spaceText,
            textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
        displayMedium: GoogleFonts.aBeeZee(color: ColorPalette.spaceText),
        displaySmall: GoogleFonts.roboto(fontSize: 10.sp, color: Colors.yellow),
        bodySmall: GoogleFonts.roboto(color: ColorPalette.darkPrimary),
      )
      //chipTheme: ,
      );
}
