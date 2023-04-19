import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            width: 135.w,
            margin: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(16.w),
            ),
            child: Stack(
              children: [
                Container(
                  width: 40.w,
                  height: 30.w,
                  margin: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "9.0",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
