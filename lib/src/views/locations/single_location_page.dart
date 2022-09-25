import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_rm_api/src/globals.dart';
import '../../constants/colors.dart';
import '../../constants/text_style.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

class SingleLocationPage extends StatelessWidget {
  const SingleLocationPage({
    Key? key,
    @PathParam() required this.locationId,
  }) : super(key: key);
  final int locationId;

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder<List<Location>>(
          future: locationClass.getListOfLocations([locationId]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError || snapshot.data == null) {
              return Center(child: Text('Error Loading Data.'));
            } else {
              var location = snapshot.data![0];

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

                        Text(location.name, style: AppTextStyle.mainCharacterTitle,),
                        Padding(padding: EdgeInsets.only(top:15.0, bottom: 10.0),
                          child:
                          Row( crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('The type of the location: ',
                                    style: AppTextStyle.grayCharacterText),
                                Expanded(child:
                                Text(location.type,
                                    style: AppTextStyle.usualText),
                                ),
                              ]),
                        ),

                        Padding(padding: EdgeInsets.only(top:15.0, bottom: 10.0),
                          child:
                          Row( crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                                Text('The dimension in which\nthe location is located: ',
                                    style: AppTextStyle.grayCharacterText),
                                Expanded(child:
                                Text(location.dimension,
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
