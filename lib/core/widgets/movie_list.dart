import 'package:flutter/material.dart';
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
    return SizedBox(
      height: 210,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => DetailPage(movieId: list[index].id),
            //     ));
          },
          child: SizedBox(
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageContainer(
                  imageUrl: Apis.imageUrl(list[index].posterPath),
                  rate: list[index].voteAverage,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 2, top: 8),
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
            SizedBox(width: 8),
      ),
    );
  }
}
