import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_rm_api/src/globals.dart';
import '../../constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';
import '../../constants/text_style.dart';
import '../characters/characters_page.dart';
import '../empty_shimmer_objects.dart';

class SingleCharacterPage extends StatelessWidget {
  const SingleCharacterPage({
    Key? key,
    @PathParam() required this.character,
  }) : super(key: key);
  final dynamic character;

  @override
  Widget build(BuildContext context) {
    List<int> characterEpisodesId = [];
    for (var el in character.episode) {
      var id = el.substring(el.lastIndexOf('/') + 1);
      characterEpisodesId.add(int.parse(id));
    }
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.cardColor,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                character.name,
                style: AppTextStyle.mainCharacterTitle,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                    height: 250,
                    imageUrl: character.image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  margin: EdgeInsets.only(right: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: getStatus(character.status),
                  ),
                  width: 10,
                  height: 10,
                ),
                Text(character.status + ' - ' + character.species,
                    style: AppTextStyle.subTitle),
              ]),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gender: ', style: AppTextStyle.grayCharacterText),
                      Expanded(
                        child: Text(character.gender,
                            style: AppTextStyle.usualText),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Origin location: ',
                          style: AppTextStyle.grayCharacterText),
                      Expanded(
                        child: Text(character.origin.name,
                            style: AppTextStyle.usualText),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Last known location: ',
                          style: AppTextStyle.grayCharacterText),
                      Expanded(
                        child: Text(character.location.name,
                            style: AppTextStyle.usualText),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('list of episodes with this character:',
                          style: AppTextStyle.grayCharacterText),
                    ]),
              ),

              FutureBuilder<List<Episode>>(
                  future: episodeClass.getListOfEpisodes(characterEpisodesId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return
                        EmptyShimmerList(count:character.episode.length);

                    } else if (snapshot.hasError || snapshot.data == null) {
                      return Center(child: Text('Error Loading Data.'));
                    } else {
                      var episodes = snapshot.data!;
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          itemCount: character.episode.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return
                                Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.backgroundColor,
                              ),
                              margin: EdgeInsets.only(top: 10.0),
                              height: 100,
                              child: Center(
                                  child: Text(
                                episodes[index].name,
                                style: AppTextStyle.mainTitle,
                                textAlign: TextAlign.center,
                              )),
                            );
                          });
                    }
                  }),
            ],
          ),
        ),
      ),

);
  }
}
