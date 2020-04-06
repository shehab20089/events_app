import 'package:events_app/screens/Event.dart';
import 'package:flutter/material.dart';

// Folder to put all routes in my app top make my main.dart file more clean
class Routes {
  static Map<String, WidgetBuilder> routes = {
    "/": (BuildContext context) => EventPage(),
  };
}
