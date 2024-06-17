import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvdb_app/constant/app_assets.dart';
import 'package:tvdb_app/provider/dashboard_controller_provider.dart';
import 'package:tvdb_app/widgets/custom_dasboard_drawer.dart';

import 'movies_view.dart';

class DashBoard extends StatelessWidget {
  DashBoard({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff283a37),
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xff1b2727), // Olive dark background color
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),

        title: Image.asset(
          AppImages.logo,
          height: 50,
          width: 80,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "You've found the most accurate source for TV and film.  Our information comes from fans like you, so create a free account and help your favorite shows and movies.  Everything added is shared with many other sites, mobile apps, and devices.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trending Movies & TV",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "powered by",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<DashBoardController>(
              builder: (BuildContext context, value, Widget? child) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 166,
                      mainAxisSpacing: 4, // Adjust spacing as needed
                      crossAxisSpacing: 4,
                      // Adjust spacing as needed
                    ),
                    itemCount: value.moviesListDataResponse.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Generate image URL or use local assets

                      return InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const MoviesView()),
                        ),
                        child: Image.network(
                          "https://artworks.thetvdb.com${value.moviesListDataResponse[index].image}",
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      //  Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         Text(
      //           "Welcome...",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //             fontWeight: FontWeight.w800,
      //           ),
      //         ),
      //         Text(
      //           "You've found the most accurate source for TV and film.  Our information comes from fans like you, so create a free account and help your favorite shows and movies.  Everything added is shared with many other sites, mobile apps, and devices.",
      //           style: TextStyle(
      //             color: Colors.white,
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 50,
      //         ),
      //         const Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(
      //               "Trending Movies & TV",
      //               style: TextStyle(
      //                 fontSize: 24,
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.w800,
      //               ),
      //             ),
      //             Text(
      //               "powered by",
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.w600,
      //               ),
      //             ),
      //           ],
      //         ),
      //         Expanded(
      //           child: Consumer<DashBoardController>(
      //             builder: (BuildContext context, value, Widget? child) {
      //               return GridView.builder(
      //                   gridDelegate:
      //                       const SliverGridDelegateWithMaxCrossAxisExtent(
      //                     maxCrossAxisExtent: 166,
      //                     mainAxisSpacing: 4, // Adjust spacing as needed
      //                     crossAxisSpacing: 4,
      //                     // Adjust spacing as needed
      //                   ),
      //                   itemCount: value.moviesListDataResponse.length,
      //                   itemBuilder: (BuildContext context, int index) {
      //                     // Generate image URL or use local assets

      //                     return InkWell(
      //                       onTap: () {
      //                         value.fetchUsers();
      //                       },
      //                       //  Navigator.of(context).push(
      //                       //   MaterialPageRoute(
      //                       //       builder: (context) => const MoviesView()),

      //                       child: Image.network(
      //                         "https://artworks.thetvdb.com/${value.moviesListDataResponse[index].image}",
      //                         fit: BoxFit.cover,
      //                       ),
      //                     );
      //                   });
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
