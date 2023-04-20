import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Api {
  static const String BASE_URL = "https://api.themoviedb.org/3/movie";
  static const String KEY = "?api_key=15cc2d06189e5b776834afe0bdef40ba";
  static const String NOW_PLAYING_URL = "$BASE_URL/now_playing$KEY";
  static String imageUrl(String path) => "https://image.tmdb.org/t/p/w500$path";
}

class Texts {
  static Text h1({required String string, Color? color}) => Text(string,
      style: GoogleFonts.fredokaOne(
        textStyle: TextStyle(
            color: color ?? Colors.black.withOpacity(0.7), fontSize: 30.sp),
      ));

  static Text h2({required String string, Color? color}) => Text(string,
      style: GoogleFonts.fredokaOne(
        textStyle: TextStyle(
            color: color ?? Colors.black.withOpacity(0.7), fontSize: 20.sp),
      ));

  static Text hint({required String string, Color? color}) => Text(string,
      style: GoogleFonts.fredokaOne(
        textStyle: TextStyle(
            color: color ?? Colors.black.withOpacity(0.7), fontSize: 13.sp),
      ));
}
