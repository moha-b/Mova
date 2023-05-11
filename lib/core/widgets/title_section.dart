import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mova/presentation/seeAll/see_all_page.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final List seeAllList;

  const TitleSection({Key? key, required this.title, required this.seeAllList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeeAllMovies(
                      title: title,
                      list: seeAllList,
                    ),
                  ));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "See all",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                Icon(
                  Iconsax.arrow_right_3,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
