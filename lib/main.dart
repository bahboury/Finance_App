import 'package:finance_app/core/routing/router_generator.dart';
import 'package:finance_app/core/styling/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true, // This line helps with initialization
      splitScreenMode: false, // This line helps with initialization
      builder:
          (context, child) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: AppTheme.lightTheme,
            routerConfig: RouterGenerator.goRouter,
          ),
    );
  }
}
