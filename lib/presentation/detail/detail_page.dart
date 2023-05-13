import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/presentation/detail/bloc/detail_bloc.dart';
import 'package:mova/presentation/detail/widgets/app_bar.dart';
import 'package:mova/presentation/detail/widgets/cast.dart';
import 'package:mova/presentation/detail/widgets/details.dart';
import 'package:mova/presentation/detail/widgets/studio.dart';

import '../../core/services/service_locator.dart';

class DetailPage extends StatelessWidget {
  final int movieId;
  const DetailPage({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<DetailBloc>()..add(GetDetailEvent(movieId: movieId)),
      child: const Scaffold(
        body: CustomScrollView(
          slivers: [
            DetailAppBarSection(),
            TextDetailsSection(),
            CastSection(),
            StudioSection(),
          ],
        ),
      ),
    );
  }
}
