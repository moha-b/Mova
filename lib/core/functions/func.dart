import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
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

Text showRelease({required movie, required BuildContext context}) {
  String dateString = movie.releaseDate;
  DateTime dateTime = DateTime.parse(dateString);
  int year = dateTime.year;
  return Text(
    year.toString(),
    style: Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.bold),
  );
}

String showTime({required DetailEntity movie}) {
  int time = movie.runtime;
  int hours = time ~/ 60;
  int remainingMinutes = time % 60;

  return '${hours}h ${remainingMinutes}m';
}

Row showRate({required DetailEntity movie, required BuildContext context}) {
  double rate = movie.voteAverage.roundToDouble();
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        Iconsax.star_1,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        rate.toString() == "0.0" ? "Undefined" : rate.toString(),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).primaryColor,
            ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Icon(
          Iconsax.arrow_right_3,
          color: Theme.of(context).primaryColor,
        ),
      ),
    ],
  );
}

String showRevenue({required DetailEntity movie}) {
  int amount = movie.revenue;
  if (amount == 0) {
    return "Undefined";
  } else {
    var formatter = NumberFormat.compact(
      locale: 'en_US',
    );
    String formattedAmount = formatter.format(amount);
    return formattedAmount;
  }
}

Row showRateAndDate(
    {required DetailEntity movie, required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      showRate(movie: movie, context: context),
      showRelease(movie: movie, context: context),
    ],
  );
}
