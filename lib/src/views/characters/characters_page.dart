import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';
import 'package:test_rm_api/src/routes/router.gr.dart';

import '../../globals.dart';

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
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text('Error Loading Data.'));
        } else {
          var characters = snapshot.data!;
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(characters[index].name),
                subtitle: Text('Index Number - ${index + 1}'),
                onTap: () => AutoRouter.of(context).push(
                  SingleCharacterRoute(
                    characterId: characters[index].id,
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
