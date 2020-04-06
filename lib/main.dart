import 'package:events_app/Routes/Routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Events-App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        initialRoute: '/',
        routes: Routes.routes);
  }
}
