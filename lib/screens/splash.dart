import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvdb_app/screens/dashboard.dart';

import '../constant/app_assets.dart';
import '../provider/splash_controller_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<SplashProvider>(
          builder: (context, provider, _) {
            print("jgvfhwvhfbrwhkfbhrwkf");
            if (provider.isInitialized) {
              print("jgvfhwvhfbrwhkfbhrwkbf");
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => DashBoard()));
              });
            } else {
              print("jgvfhwvhfbrwhkf");
            }
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.logo),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


    // Scaffold(
    //   backgroundColor: Color(0xff283a37),
    //   body: Container(
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage(AppImages.logo),
    //       ),
    //     ),
    //   ),
    // );

