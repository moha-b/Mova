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
    return SizedBox(
      height: 210.h,
      child: ListView.separated(
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
          child: SizedBox(
            width: 120.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageContainer(
                  imageUrl: Network.imageUrl(list[index].posterPath),
                  rate: list[index].voteAverage,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 2.w, top: 8.h),
                  child: Text(
                    list[index].title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 8.w),
      ),
    );
  }
}
