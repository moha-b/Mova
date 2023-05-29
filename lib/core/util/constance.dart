// class Apis {
//   static const String BASE_URL = "https://api.themoviedb.org/3/movie";
//   static const String KEY = "?api_key=15cc2d06189e5b776834afe0bdef40ba";
//   static const String NOW_PLAYING_URL = "$BASE_URL/now_playing$KEY";
//   static const String TOP_RATED_URL = "$BASE_URL/top_rated$KEY";
//   static const String UPCOMING_URL = "$BASE_URL/upcoming$KEY";
//   static String imageUrl(String path) => "https://image.tmdb.org/t/p/w500$path";
//   static String detailUrl(int movieId) => "$BASE_URL/$movieId$KEY";
//   static String testUrl() =>
//       "https://api.themoviedb.org/3/movie/868759?api_key=15cc2d06189e5b776834afe0bdef40ba";
// }

abstract class UrlBuilder {
  static const String BASE_URL = "https://api.themoviedb.org/3/movie";
  static const String API_KEY = "?api_key=15cc2d06189e5b776834afe0bdef40ba";

  static String buildUrl({required String path, String? endPoint}) =>
      "$BASE_URL$path$API_KEY";
}

class ImageUrlBuilder {
  static const String BASE_URL = "https://image.tmdb.org/t/p/w500";

  static String buildUrl(String path) => "$BASE_URL$path";
}

class Api {
  static String getNowPlayingUrl() => UrlBuilder.buildUrl(path: "/now_playing");

  static String getTopRatedUrl() => UrlBuilder.buildUrl(path: "/top_rated");

  static String getUpcomingUrl() => UrlBuilder.buildUrl(path: "/upcoming");

  static String getImageUrl(String path) => ImageUrlBuilder.buildUrl(path);

  static String getDetailUrl(int movieId) =>
      UrlBuilder.buildUrl(path: "/$movieId");

  static String getCastUrl(int movieId) =>
      UrlBuilder.buildUrl(path: "/$movieId");

  static String getTestUrl() => UrlBuilder.buildUrl(path: "/868759");
}
