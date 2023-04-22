import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova/core/util/constance.dart';
import 'package:mova/domain/entities/movie_entity.dart';

import 'image_container.dart';

class MovieList extends StatelessWidget {
  final List<MovieEntity> list;
  const MovieList({
    required this.list,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      padding: EdgeInsets.only(left: 16.w),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) => ImageContainer(
          imageUrl: Api.imageUrl(list[index].posterPath),
          rate: list[index].voteAverage,
        ),
      ),
    );
  }
}
