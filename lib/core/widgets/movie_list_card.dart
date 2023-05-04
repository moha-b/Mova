import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../presentation/detail/detail_page.dart';
import '../util/constance.dart';

class MovieListCard extends StatelessWidget {
  final List list;
  const MovieListCard({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        movieId: list[index].id,
                      ),
                    ));
              },
              child: SizedBox(
                  height: 150,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.w),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        margin: EdgeInsets.all(16.w),
                        height: 130.h,
                      ),
                      Positioned(
                        left: 35.w,
                        top: 0,
                        bottom: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: Network.imageUrl(list[index].posterPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                            width: 110.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 160.w,
                        top: 0,
                        bottom: 0,
                        child: SizedBox(
                          height: 120.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h),
                              Text(
                                list[index].title,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                list[index].popularity.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                list[index].releaseDate,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
        separatorBuilder: (context, index) => SizedBox(
              height: 8.h,
            ),
        itemCount: list.length);
  }
}
