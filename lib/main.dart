import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/services/service_locator.dart';
import 'package:mova/presentation/bloc/theme_bloc.dart';
import 'package:mova/presentation/detail/detail_page.dart';

void main() async {
  ServicesLocator().init();
  runApp(const Mova());
}

class Mova extends StatelessWidget {
  const Mova({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            home: DetailPage(),
          );
        },
      ),
    );
  }
}
