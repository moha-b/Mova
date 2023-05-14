import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mova/core/util/constance.dart';
import 'package:mova/domain/entities/movie_entity.dart';
import 'package:shimmer/shimmer.dart';

SizedBox buildMovieGrid({required List<MovieEntity> movie}) {
  return SizedBox(
    width: double.infinity,
    child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: movie.length,
        padding: const EdgeInsets.only(top: 16, left: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 8, childAspectRatio: 1),
        itemBuilder: (context, index) => SizedBox(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: Network.imageUrl(movie[index].posterPath),
                      width: 150,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    left: 8.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        movie[index].voteAverage.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )),
  );
}
