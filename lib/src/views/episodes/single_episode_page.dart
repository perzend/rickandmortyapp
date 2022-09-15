import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SingleEpisodePage extends StatelessWidget {
  const SingleEpisodePage({
    Key? key,
    @PathParam() required this.episodeId,
  }) : super(key: key);
  final int episodeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.blue[100],));
  }
}
