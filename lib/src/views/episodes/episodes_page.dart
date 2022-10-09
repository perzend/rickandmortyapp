import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';
import 'package:test_rm_api/src/constants/text_style.dart';

import '../../globals.dart';
import '../../routes/router.gr.dart';
import '../../constants/colors.dart';


class EpisodesPage extends StatelessWidget {
  const EpisodesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Episode>>(
      future: episodeClass.getAllEpisodes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text('Error Loading Data.'));
        } else {
          var episodes = snapshot.data!;
          return ListView.builder(
            itemCount: episodes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => AutoRouter.of(context).push(
                  SingleEpisodeRoute(
                    episode: episodes[index],
                  ),
                ),

                child: Container( decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: AppColors.cardColor,),
              height: 150,
              margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.all(10.0),
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(episodes[index].name, style: AppTextStyle.mainTitle, textAlign: TextAlign.center,),
                      Text('The air date of the episode:',style: AppTextStyle.greyText,),
                      Text(episodes[index].airDate, style: AppTextStyle.usualText,),

                    ],),
                ),
              );
            },
          );
        }
      },
    );
  }
}
