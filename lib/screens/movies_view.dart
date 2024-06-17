import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvdb_app/constant/app_colors.dart';

import '../provider/dashboard_controller_provider.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<DashBoardController>(
        builder: (BuildContext context, value, Widget? child) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: Container(
                  width: 549,
                  height: 373,
                  child: Image.network(
                    'https://artworks.thetvdb.com/banners/v4/movie/8/posters/60bc273188ee0.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Movie Name",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
              Text(
                "In the Summer of 2024, Paris is hosting the World Triathlon Championships on the Seine for the first time. Sophia, a brilliant scientist, learns from Mika, a young environmental activist, that a large shark is swimming deep in the river. To avoid a bloodbath at the heart of the city, they have no choice but to join forces with Adil, the Seine river police commander.",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 16,
                      color: AppColors.appWhiteColors,
                    ),
              ),
            ],
          );
        },
      ),
    );
  }
}
