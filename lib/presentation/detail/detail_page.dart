import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/presentation/detail/bloc/detail_bloc.dart';
import 'package:mova/presentation/detail/component/cast_component.dart';
import 'package:mova/presentation/detail/component/movie_details_component.dart';
import 'package:mova/presentation/detail/component/movie_text_detail_component.dart';

import '../../core/services/service_locator.dart';
import 'component/studio_component.dart';

class DetailPage extends StatelessWidget {
  final int movieId;
  const DetailPage({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<DetailBloc>()..add(GetDetailEvent(movieId: movieId)),
      child: const Scaffold(
        body: CustomScrollView(
          slivers: [
            MovieDetailsComponent(),
            MovieTextDetailComponent(),
            StudioComponent(),
            CastComponent(),
          ],
        ),
      ),
    );
  }
}
