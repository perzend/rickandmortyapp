import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

import '../../globals.dart';
import '../../routes/router.gr.dart';
import '../../constants/colors.dart';
import '../../constants/text_style.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Location>>(
      future: locationClass.getAllLocations(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text('Error Loading Data.'));
        } else {
          var locations = snapshot.data!;
          return ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => AutoRouter.of(context).push(
                  SingleLocationRoute(
                    locationId: locations[index].id,
                  ),
                ),

                child: Container( decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: AppColors.cardColor,),
                  height: 150,
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.all(10.0),
                  child:
                  Expanded(child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(locations[index].name, style: AppTextStyle.mainTitle,),
                      Text('The type of the location:',style: AppTextStyle.greyText,),
                      Text(locations[index].type, style: AppTextStyle.usualText,),

                    ],),
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
