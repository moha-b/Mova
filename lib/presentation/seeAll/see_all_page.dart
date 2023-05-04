import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/widgets/movie_list_card.dart';

class SeeAll extends StatelessWidget {
  final String title;
  final List list;
  const SeeAll({required this.title, Key? key, required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Iconsax.arrow_left_2)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: MovieListCard(
            list: list,
          ),
        ),
      ),
    );
  }
}
