import 'package:flutter/material.dart';
import 'package:mova/presentation/features/Home/widgets/movies_list.dart';
import 'package:mova/presentation/features/Home/widgets/now_playing_section.dart';
import 'package:mova/presentation/features/Home/widgets/title_section.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            NowPlayingSection(),
            TitleSection(title: "Top Rated Movies"),
            MoviesList(),
            TitleSection(title: "Upcoming"),
            MoviesList(),
          ],
        ),
      ),
    );
  }
}
