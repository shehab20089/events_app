//a folder to put all my app screens as here for Events page.
import 'package:events_app/utilities/ResponsiveMethods.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  EventPage({Key key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        height: ResponsiveMethods.hp(context, 10),
        width: ResponsiveMethods.wp(context, 100),
        color: Colors.red,
        child: Center(
          child: Row(
            children: <Widget>[Icon(Icons.star_border)],
          ),
        ),
      ),
      Opacity(
        opacity: 0.3,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/InivolaTask.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: null /* add child content here */,
        ),
      ),
    ]);
  }
}
