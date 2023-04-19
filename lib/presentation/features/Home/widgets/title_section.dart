import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleSection extends StatelessWidget {
  final String title;
  const TitleSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20.sp),
            ),
            Text(
              "See all",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
