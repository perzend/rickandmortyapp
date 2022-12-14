import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';
import 'package:test_rm_api/src/routes/router.gr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_rm_api/src/views/characters/empty_characters_page.dart';
import '../../constants/colors.dart';
import '../../constants/text_style.dart';
import '../empty_shimmer_objects.dart';
import '../../globals.dart';

getStatus(value){
  if (value=='Alive') {
    return AppColors.aliveColor;
  }     else if (value=='Dead')  {
    return AppColors.deadColor;
  } else return AppColors.unknowColor;
}

class CharactersPage extends StatelessWidget {
  const CharactersPage({
    Key? key,
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Character>>(
      future: charactersClass.getAllCharacters(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return EmptyCharactersPage();
        } else if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text('Error Loading Data.'));
        } else {
          var characters = snapshot.data!;
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {

              var urlFirstEpisode=characters[index].episode[0];
              var idFirstEpisode=int.parse(urlFirstEpisode.substring(urlFirstEpisode.lastIndexOf('/') + 1));

              return GestureDetector(
                child:
                Container( decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: AppColors.cardColor,),
                  height: 150,
                  margin: EdgeInsets.all(5.0),
                  // padding: EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //???????????? ?????????????? ?????? ???? ??????????, ???? ???????????????? ?????? ClipRRect ?????????????? ??????????????????????????, ?? ???????????????? ???????????????? ???????????? ????????
                        Padding(padding: EdgeInsets.only(right:10.0),
                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child:
                            CachedNetworkImage(
                              imageUrl: characters[index].image,
                              placeholder: (context, url) => EmptyShimmerBox(width: 150, height: 150),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ),
                        ),

                        Expanded(child:
                        Column( crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(characters[index].name,
                                style: AppTextStyle.mainTitle),
                            Row(
                                children:  [
                                  Container(
                                    margin: EdgeInsets.only(right: 5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: getStatus(characters[index].status),
                                    ),
                                    width: 10,
                                    height: 10,
                                  ),
                                  //?????????? ???????????????? ?????? ??????????????????
                                  Expanded(
                                    child:
                                    Text(characters[index].status+' - '+characters[index].species,
                                        style: AppTextStyle.subTitle),
                                  ),]),

                            Padding(padding: EdgeInsets.only(top:5.0),
                              child:
                              Text('First seen in:',
                                  style: AppTextStyle.greyText),
                            ),
                            Padding(padding: EdgeInsets.only(top:5.0),
                              child:
                              //?? ?????? ???????????? ?????????? ???????????????????? ?????????? ???????????? =(

                              FutureBuilder<List<Episode>>(
                                  future: episodeClass.getListOfEpisodes([idFirstEpisode]),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return Center(child: EmptyShimmerBox(height: 30,width: 200));
                                    } else if (snapshot.hasError || snapshot.data == null) {
                                      return Center(child: Text('Error Loading Data.'));
                                    } else {
                                      var episode = snapshot.data![0];
                                      return Text(episode.name, style: AppTextStyle.usualText);
                                    } }),
                            ),


                          ],),
                          // ),

                        ),
                        // ),
                      ]),
                ),
                onTap: () => AutoRouter.of(context).push(
                  SingleCharacterRoute(
                    character: characters[index],
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

