import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class Api {
//   String _BASE_URL = "https://api.themoviedb.org/3/movie";
//   String _KEY = "?api_key=15cc2d06189e5b776834afe0bdef40ba";
//
//   String _NOW_PLAYING_Api = "$_BASE_URL/now_playing$_KEY";
//   String _TOP_RATED_Api = "$_BASE_URL/top_rated$_KEY";
//   String _UPCOMING_Api = "$_BASE_URL/upcoming$_KEY";
// }

class Network {
  static const String BASE_URL = "https://api.themoviedb.org/3/movie";
  static const String KEY = "?api_key=15cc2d06189e5b776834afe0bdef40ba";
  static const String NOW_PLAYING_URL = "$BASE_URL/now_playing$KEY";
  static const String TOP_RATED_URL = "$BASE_URL/top_rated$KEY";
  static const String UPCOMING_URL = "$BASE_URL/upcoming$KEY";
  static String imageUrl(String path) => "https://image.tmdb.org/t/p/w500$path";
  static String detailUrl(int movieId) => "$BASE_URL/$movieId$KEY";
  static String testUrl() =>
      "https://api.themoviedb.org/3/movie/868759?api_key=15cc2d06189e5b776834afe0bdef40ba";
}
