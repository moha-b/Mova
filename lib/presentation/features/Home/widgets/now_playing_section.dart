import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NowPlayingSection extends StatelessWidget {
  const NowPlayingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      color: Colors.blueGrey,
      width: double.infinity,
      height: 350.h,
      child: Stack(
        children: [
          customAppBar(),
          Positioned(
            bottom: 1.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title here",
                  style: TextStyle(fontSize: 20.sp, color: Colors.white),
                ),
                SizedBox(height: 10.h),
                Text(
                  "data",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 0,
                            backgroundColor: Colors.red),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.play_circle_rounded,
                              size: 16.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text("Play"),
                          ],
                        )),
                    SizedBox(
                      width: 10.w,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.white, width: 2.w),
                            ),
                            elevation: 0,
                            backgroundColor: Colors.transparent),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.add_rounded,
                              size: 16.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text("My List"),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container customAppBar() {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.logo_dev),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            ],
          ),
        ],
      ),
    );
  }
}
