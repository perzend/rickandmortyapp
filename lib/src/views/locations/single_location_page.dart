import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SingleLocationPage extends StatelessWidget {
  const SingleLocationPage({
    Key? key,
    @PathParam() required this.locationId,
  }) : super(key: key);
  final int locationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.greenAccent[100],));
  }
}
