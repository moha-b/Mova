import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mova/core/resources/colors.dart';
import 'package:mova/domain/entities/detail_entity.dart';
import 'package:mova/domain/entities/genre_entity.dart';

String showGenres(List<GenreEntity> genres) {
  String result = '';
  for (var genre in genres) {
    result += '${genre.name}, ';
  }
  if (result.isEmpty) {
    return result;
  }
  result = result.substring(0, result.length - 2);
  return result;
}

String showRelease(movie) {
  String dateString = movie!.releaseDate!;
  DateTime dateTime = DateTime.parse(dateString);
  int year = dateTime.year;
  return year.toString();
}

String showTime({DetailEntity? movie}) {
  int time = movie!.runtime!;
  int hours = time ~/ 60;
  int remainingMinutes = time % 60;

  return '${hours}h ${remainingMinutes}m';
}

Row _showRate({DetailEntity? movie}) {
  double rate = movie!.voteAverage.roundToDouble();
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SvgPicture.asset(
        "assets/icons/star.svg",
        color: ColorPalette.darkPrimary,
        width: 17,
      ),
      SizedBox(
        width: 8,
      ),
      Text(rate.toString() == "0.0" ? "Undefined" : rate.toString()),
    ],
  );
}

String _showRevenue({DetailEntity? movie}) {
  int amount = movie!.revenue!;
  if (amount == 0) {
    return "Undefined";
  } else {
    var formatter = NumberFormat.compact(
      locale: 'en_US',
    );
    String formattedAmount = formatter.format(amount);
    print("formattedAmount :: $formattedAmount");
    return formattedAmount;
  }
}
