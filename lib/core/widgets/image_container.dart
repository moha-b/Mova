import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  final double rate;

  const ImageContainer({Key? key, required this.imageUrl, required this.rate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      width: 140.w,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => Center(
                child: Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            top: 8.0,
            left: 8.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                "$rate",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
