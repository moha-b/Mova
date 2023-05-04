import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/title_section.dart';

class CastComponent extends StatelessWidget {
  const CastComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          TitleSection(
            title: 'Cast',
            seeAllList: [],
          ),
          Container(
            height: 150.h,
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2.2,
              ),
              itemCount: 3,
              itemBuilder: (context, index) => _cast(),
            ),
          ),
        ],
      ),
    );
  }

  Container _cast() {
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      child: Row(
        children: [
          CircleAvatar(radius: 25.r),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Actor Name"),
              Text("Character"),
            ],
          )
        ],
      ),
    );
  }
}
