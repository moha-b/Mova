import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mova/core/services/service_locator.dart';
import 'package:mova/core/util/constance.dart';
import 'package:mova/core/widgets/title_section.dart';

import '../../../core/widgets/movie_list.dart';
import '../../bloc/movie_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieBloc>()..add(GetNowPlayingEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40.h),
              SearchSection(),
              TitleSection(title: "Now Playing", isLoading: false),
              MovieList(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Texts.h1(string: "Choose a"),
          Texts.h1(string: "Movie for today"),
          Padding(
            padding: EdgeInsets.only(top: 25.w),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 18),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                hintText: 'Find a movie that interests you',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                prefixIcon: Icon(
                  Iconsax.search_normal,
                  color: Colors.black54,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
