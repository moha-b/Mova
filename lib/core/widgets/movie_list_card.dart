import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova/core/util/constance.dart';
import 'package:shimmer/shimmer.dart';

class MovieListCard extends StatelessWidget {
  const MovieListCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate here
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 20.h),
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  color: Colors.white70,
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
                    imageUrl:
                        "https://metagalaxia.com.br/wp-content/uploads/2023/03/Hells-Paradise-Jigokuraku-2.webp",
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 110,
                        height: 150,
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
                      Texts.h2(string: "Title", context: context),
                      SizedBox(height: 40.h),
                      Texts.h2(string: "Popularity", context: context),
                      Texts.h2(string: "Release", context: context),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
