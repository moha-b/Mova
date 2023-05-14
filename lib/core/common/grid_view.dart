import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mova/core/util/constance.dart';
import 'package:mova/domain/entities/movie_entity.dart';
import 'package:mova/presentation/detail/detail_page.dart';

Container buildMovieGrid({required List<MovieEntity> movie}) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    child: StaggeredGridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: movie.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 15,
        staggeredTileCount: movie.length,
        staggeredTileBuilder: (int index) {
          if (index % 2 == 0) {
            return const StaggeredTile.extent(1, 200);
          } else {
            return const StaggeredTile.extent(1, 250);
          }
        },
      ),
      itemBuilder: (context, index) => SizedBox(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(movieId: movie[index].id),
                ));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: Network.imageUrl(movie[index].posterPath),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ),
  );
}
