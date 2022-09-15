import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';
import 'package:test_rm_api/src/views/specified_chars_list.dart';
import 'package:test_rm_api/src/views/specified_eps_list.dart';
import 'package:test_rm_api/src/views/specified_locations_list.dart';

import '../globals.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Characters'),
            Divider(),
            SpecifiedCharacterListView(),
            Text('Episodes'),
            Divider(),
            SpecifiedEpisodeListView(),
            Text('Locations'),
            Divider(),
            SpecifiedLocationListView(),
          ],
        ),
      ),
    );
  }
}
