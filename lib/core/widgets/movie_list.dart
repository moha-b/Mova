import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova/core/util/constance.dart';
import 'package:mova/domain/entities/movie_entity.dart';
import 'package:mova/presentation/detail/detail_page.dart';

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
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.only(left: 16.w),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(movieId: list[index].id),
                ));
          },
          child: ImageContainer(
            imageUrl: Network.imageUrl(list[index].posterPath),
            rate: list[index].voteAverage,
          ),
        ),
      ),
    );
  }
}
