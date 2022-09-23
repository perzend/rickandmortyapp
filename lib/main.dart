import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/routes/router.gr.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppWidget());
}


class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black45),
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Rick & Morty App',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
