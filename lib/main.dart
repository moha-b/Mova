import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova/core/services/service_locator.dart';
import 'package:mova/core/theme/dark_theme.dart';
import 'package:mova/presentation/home/main_page.dart';

void main() async {
  ServicesLocator().init();
  await ScreenUtil.ensureScreenSize();
  runApp(const Mova());
}

class Mova extends StatelessWidget {
  const Mova({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp(
          theme: DarkTheme(),
          debugShowCheckedModeBanner: false,
          home: const MainPage(),
        );
      },
    );
  }
}
