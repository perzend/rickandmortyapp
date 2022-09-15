import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

import '../globals.dart';
import '../routes/router.gr.dart';

List<int> _charIDs = [1, 10, 5];

class SpecifiedCharacterListView extends StatelessWidget {
  const SpecifiedCharacterListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Character>>(
      future: charactersClass.getListOfCharacters(_charIDs),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text('Error Loading Data.'));
        } else {
          var characters = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(characters[index].name),
                subtitle: Text('Index Number - ${index + 1}'),
                onTap: () => AutoRouter.of(context).navigate(
                  CharactersRouter(
                    children: [
                      SingleCharacterRoute(characterId: characters[index].id),
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
