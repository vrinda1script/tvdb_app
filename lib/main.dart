import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvdb_app/constant/app_colors.dart';
import 'package:tvdb_app/provider/login_controller_provider.dart';
import 'package:tvdb_app/screens/dashboard.dart';
import 'package:tvdb_app/screens/splash.dart';

import 'provider/dashboard_controller_provider.dart';
import 'provider/splash_controller_provider.dart';
import 'screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginController()),
          ChangeNotifierProvider(create: (_) => DashBoardController()),
          ChangeNotifierProvider(create: (_) => SplashProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: TextTheme(
              displayLarge: TextStyle(
                color: AppColors.appWhiteColors,
                fontSize: 24,
              ),
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.appDashBoardBGColors,
            appBarTheme: AppBarTheme(
                color: AppColors.appAppBarBGColors, // Change app bar color
                iconTheme: IconThemeData(
                  color: AppColors.appWhiteColors,
                )),
          ),
          home: SplashScreen(),
        ));
  }
}
