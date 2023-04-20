import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mova/core/services/service_locator.dart';
import 'package:mova/core/util/constance.dart';
import 'package:mova/core/widgets/title_section.dart';
import 'package:mova/presentation/features/Home/search_page.dart';

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
    return Container(
      margin: EdgeInsets.only(top: 40.h),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Texts.h1(string: "Choose a"),
          Texts.h1(string: "Movie for today"),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
            child: Hero(
              tag: "searchPage",
              child: Container(
                margin: EdgeInsets.only(top: 25.w),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.w)),
                  color: Colors.grey.withOpacity(0.1),
                  child: ListTile(
                    leading: Icon(Iconsax.search_normal),
                    title: Texts.hint(
                      string: "Find a movie that interests you",
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
