import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../util/constance.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final bool isLoading;

  const TitleSection({Key? key, required this.title, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTitle(context),
          _buildSeeAll(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    if (!isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Texts.h2(string: title),
      );
    } else {
      return Texts.h2(string: title);
    }
  }

  Widget _buildSeeAll(BuildContext context) {
    if (!isLoading) {
      return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Text(
            "See all",
            style: TextStyle(color: Colors.red),
          ));
    } else {
      return Text(
        "See all",
        style: TextStyle(color: Colors.red),
      );
    }
  }
}
