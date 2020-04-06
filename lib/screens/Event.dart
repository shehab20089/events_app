//a folder to put all my app screens as here for Events page.
import 'package:events_app/Components/CustomAppBar.dart';
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
      Positioned(
        top: 0,
        child: CustomAppBar(
          onSharePressed: () {
            print('share');
          },
          onBackPressed: () {
            // TODO Make Navigator.pop(context);

            print('back presssed');
          },
          onFavPressed: () {
            print('i like this event');
          },
        ),
      ),
    ]);
  }
}
