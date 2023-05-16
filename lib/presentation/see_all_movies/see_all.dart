import 'package:flutter/material.dart';
import 'package:mova/presentation/see_all_movies/widgets/movies.dart';

import '../../domain/entities/movie_entity.dart';

class TestSee extends StatefulWidget {
  final List<MovieEntity> movieList;
  final String title;
  const TestSee({super.key, required this.movieList, required this.title});

  @override
  State<TestSee> createState() => _TestSeeState();
}

class _TestSeeState extends State<TestSee> {
  late Size size;
  double top = -300;
  double left = -300;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          var topPos = top + (details.delta.dy * 1.5);
          var leftPos = left + (details.delta.dx * 1.5);
          //set the state
          setState(() {
            top = topPos;
            left = leftPos;
          });
        },
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOut,
                top: top,
                left: left,
                child: AllMovies(
                  movieList: widget.movieList,
                  title: '',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
