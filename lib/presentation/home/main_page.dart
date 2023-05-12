import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/services/service_locator.dart';
import 'package:mova/presentation/home/widgets/carousel_slider_widget.dart';
import 'package:mova/presentation/home/widgets/movie_list.dart';

import 'bloc/movie_bloc.dart';

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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                CarouselSliderWidget(),
                MovieListWidget(
                  type: 1,
                  title: "Top Rated",
                ),
                MovieListWidget(type: 2, title: "Upcoming"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
