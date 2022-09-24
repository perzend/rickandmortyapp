import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_rm_api/src/routes/router.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../src/constants/colors.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        backgroundColor: AppColors.backgroundColor,
        title:
            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Rick & Morty App'),
              ElevatedButton(
                  style:  ElevatedButton.styleFrom(
                      backgroundColor: Colors.black),
                  onPressed: (){},
                  child:
              Center(child:
                Text('Log out'),)
              )]
            ),
        centerTitle: true,
        leading: const AutoLeadingButton(),
      ),
      backgroundColor: AppColors.appBarColor,
      routes: [
        CharactersRouter(),
        EpisodesRouter(),
        LocationsRouter(),
        FavouritesRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              selectedColor: Colors.amberAccent[100],
              icon: const Icon(
                Icons.person,
                size: 30,
              ),
              title: const Text('Characters'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.blueAccent[100],
              icon: const Icon(
                Icons.batch_prediction,
                size: 30,
              ),
              title: const Text('Episodes'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.greenAccent[100],
              icon: const Icon(
                Icons.location_pin,
                size: 30,
              ),
              title: const Text('Locations'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.pinkAccent[100],
              icon: const Icon(
                Icons.favorite,
                size: 30,
              ),
              title: const Text('Favourites'),
            ),
          ],
        );
      },
    );
  }
}
