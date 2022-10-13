import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_rm_api/src/globals.dart';
import '../../constants/colors.dart';
import '../../constants/text_style.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';
import '../empty_shimmer_objects.dart';

class SingleLocationPage extends StatelessWidget {
  const SingleLocationPage({
    Key? key,
    @PathParam() required this.location,
  }) : super(key: key);
  final dynamic location;

  @override
  Widget build(BuildContext context) {
    List<int> locationCharactersId = [];
    for (var el in location.residents) {
      var id = el.substring(el.lastIndexOf('/') + 1);
      locationCharactersId.add(int.parse(id));
    }
    return
                Scaffold(backgroundColor: AppColors.backgroundColor, body:
                SingleChildScrollView(
                  child: Container( margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: AppColors.cardColor,),
                    width:double.infinity,
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text(location.name, style: AppTextStyle.mainCharacterTitle,),
                        Padding(padding: EdgeInsets.only(top:15.0, bottom: 10.0),
                          child:
                          Row( crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('The type of the location: ',
                                    style: AppTextStyle.grayCharacterText),
                                Text(location.type,
                                    style: AppTextStyle.usualText),
                              ]),
                        ),

                        Padding(padding: EdgeInsets.only(top:15.0, bottom: 10.0),
                          child:
                          Row( crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                                Text('The dimension in which\nthe location is located: ',
                                    style: AppTextStyle.grayCharacterText),
                                Text(location.dimension,
                                    style: AppTextStyle.usualText),
                              ]),
                        ),

                        Padding(padding: EdgeInsets.only(top:5.0),
                          child:
                          Row( crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('List of character who have been\nlast seen in the location:',
                                    style: AppTextStyle.grayCharacterText),
                              ]),
                        ),

                        FutureBuilder<List<Character>>(
                            future: charactersClass.getListOfCharacters(locationCharactersId),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return
                                  EmptyShimmerList(count:location.residents.length);
                              } else if (snapshot.hasError || snapshot.data == null) {
                                return Center(child: Text('Error Loading Data.'));
                              } else {
                                var characters = snapshot.data!;
                                return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: location.residents.length,
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
                                                characters[index].name,
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
                )
                );

  }
}
