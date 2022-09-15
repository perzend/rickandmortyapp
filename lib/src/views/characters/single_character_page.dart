import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SingleCharacterPage extends StatelessWidget {
  const SingleCharacterPage({
    Key? key,
    @PathParam() required this.characterId,
  }) : super(key: key);
  final int characterId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.amberAccent[100],));
  }
}
