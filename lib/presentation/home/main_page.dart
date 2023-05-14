import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mova/core/services/service_locator.dart';
import 'package:mova/presentation/home/widgets/carousel_slider_widget.dart';
import 'package:mova/presentation/home/widgets/movie_list.dart';

import 'bloc/movie_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<MovieBloc>()
          ..add(GetNowPlayingEvent())
          ..add(GetTopRatedEvent())
          ..add(GetUpcomingEvent()),
        child: Scaffold(
            body: const SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CarouselSliderWidget(),
                    MovieListWidget(
                      type: 1,
                      title: "Top Rated",
                    ),
                    MovieListWidget(type: 2, title: "Upcoming"),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            extendBody: true,
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: GNav(
                    haptic: true,
                    tabBorderRadius: 10,
                    tabMargin: EdgeInsets.only(bottom: 10),
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 330),
                    gap: 8,
                    color: Colors.white,
                    activeColor: Theme.of(context).primaryColor,
                    iconSize: 24,
                    tabBackgroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: const EdgeInsets.all(10),
                    tabs: const [
                      GButton(
                        icon: Iconsax.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Iconsax.save_2,
                        text: 'My List',
                      ),
                      GButton(
                        icon: Iconsax.discover_1,
                        text: 'Explore',
                      ),
                      GButton(
                        icon: Iconsax.direct_inbox,
                        text: 'Downloads',
                      ),
                      GButton(
                        icon: Iconsax.user,
                        text: 'Profile',
                      )
                    ]),
              ),
            )));
  }
}
