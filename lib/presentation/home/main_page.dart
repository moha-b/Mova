import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/services/service_locator.dart';
import 'package:mova/core/widgets/title_section.dart';

import 'bloc/movie_bloc.dart';
import 'component/now_playing_component.dart';
import 'component/top_rated_component.dart';
import 'component/upcoming_component.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build Page");
    return BlocProvider(
      create: (context) => getIt<MovieBloc>()
        ..add(GetNowPlayingEvent())
        ..add(GetTopRatedEvent())
        ..add(GetUpcomingEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: const [
              NowPlayingComponent(),
              TitleSection(title: "Top Rated", isLoading: true),
              TopRatedComponent(),
              TitleSection(title: "Upcoming", isLoading: true),
              UpcomingComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
