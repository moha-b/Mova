import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mova/core/services/service_locator.dart';

import '../bloc/movie_bloc.dart';
import 'components/now_playing_component.dart';
import 'components/popular_component.dart';
import 'components/top_rated_component.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<MovieBloc>()
        ..add(GetNowPlayingEvent())
        ..add(GetTopRatedEvent())
        ..add(GetUpcomingEvent()),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              key: const Key('movieScrollView'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NowPlayingComponent(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "popular",
                          style: GoogleFonts.poppins(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            /// TODO : NAVIGATION TO POPULAR SCREEN
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Text(
                                  "seeMore",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const UpcomingComponent(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(
                      16.0,
                      24.0,
                      16.0,
                      8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "topRated",
                          style: GoogleFonts.poppins(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            /// TODO : NAVIGATION TO Top Rated Movies Screen
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Text(
                                  "seeMore",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const TopRatedComponent(),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
