import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

import '../globals.dart';
import '../routes/router.gr.dart';

List<int> _epIDs = [10, 30, 20, 15];

class SpecifiedEpisodeListView extends StatelessWidget {
  const SpecifiedEpisodeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Episode>>(
      future: episodeClass.getListOfEpisodes(_epIDs),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text('Error Loading Data.'));
        } else {
          var episodes = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: episodes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(episodes[index].name),
                subtitle: Text('Index Number - ${index + 1}'),
                onTap: () => AutoRouter.of(context).navigate(
                  EpisodesRouter(
                    children: [
                      SingleEpisodeRoute(episodeId: episodes[index].id),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
