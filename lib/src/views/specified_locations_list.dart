import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

import '../globals.dart';
import '../routes/router.gr.dart';

List<int> _locIDs = [16, 10, 19];

class SpecifiedLocationListView extends StatelessWidget {
  const SpecifiedLocationListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Location>>(
      future: locationClass.getListOfLocations(_locIDs),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text('Error Loading Data.'));
        } else {
          var locations = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(locations[index].name),
                subtitle: Text('Index Number - ${index + 1}'),
                onTap: () => AutoRouter.of(context).navigate(
                  LocationsRouter(
                    children: [
                      SingleLocationRoute(locationId: locations[index].id),
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
