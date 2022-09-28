import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_rm_api/src/globals.dart';
import '../../constants/colors.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';
import '../../constants/text_style.dart';

class SingleEpisodePage extends StatelessWidget {
  const SingleEpisodePage({
    Key? key,
    @PathParam() required this.episodeId,
  }) : super(key: key);
  final int episodeId;

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder<List<Episode>>(
          future: episodeClass.getListOfEpisodes([episodeId]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError || snapshot.data == null) {
              return Center(child: Text('Error Loading Data.'));
            } else {
              var episode = snapshot.data![0];

              return
                Scaffold(backgroundColor: AppColors.backgroundColor, body:
                Container( margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: AppColors.cardColor,),
                  width:double.infinity,
                  child:
                  Expanded(
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text(episode.name, style: AppTextStyle.mainCharacterTitle,),
                        Padding(padding: EdgeInsets.only(top:15.0, bottom: 10.0),
                          child:
                          Row( crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('The air date of the episode: ',
                                    style: AppTextStyle.grayCharacterText),
                                Expanded(child:
                                Text(episode.airDate,
                                    style: AppTextStyle.usualText),
                                ),
                              ]),
                        ),

                        Padding(padding: EdgeInsets.only(top:5.0),
                          child:
                          Row( crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('list of characters with this episode:',
                                    style: AppTextStyle.grayCharacterText),
                              ]),
                        ),

                      ],
                    ),
                  ),
                )
                );

            }
          });
  }
}
