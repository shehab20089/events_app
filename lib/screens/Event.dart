//a folder to put all my app screens as here for Events page.
import 'package:events_app/Components/CustomAppBar.dart';
import 'package:events_app/Components/curoselIndicatior.dart';
import 'package:events_app/utilities/ResponsiveMethods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventPage extends StatefulWidget {
  EventPage({Key key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CuroselIndicatior(
                imgList: imgList,
              ),
              buildEventTag(context),
              buildEventTitle(context),
              buildEventDate(context),
              buildEventLocation(context)
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: CustomAppBar(
            onSharePressed: () {
              print('share');
            },
            onBackPressed: () {
              // TODO Make Naviga`tor.pop(context);

              print('back presssed');
            },
            onFavPressed: () {
              print('i like this event');
            },
          ),
        ),
        if (!clicked)
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
            bottom: 0,
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                setState(() {
                  this.clicked = !this.clicked;
                });
              },
              child: Text('Click Me'),
            ))
      ]),
    );
  }

  Padding buildEventLocation(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: ResponsiveMethods.wp(context, 4),
          top: ResponsiveMethods.hp(context, 0.6)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FaIcon(
            FontAwesomeIcons.thumbtack,
            size: 14,
            color: Colors.black26,
          ),
          SizedBox(
            width: ResponsiveMethods.wp(context, 3),
          ),
          Text(
            'عنوان الدوره أو الحدث بشكل كامل',
            style: TextStyle(
              color: Colors.black26,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Padding buildEventDate(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: ResponsiveMethods.wp(context, 4),
          top: ResponsiveMethods.hp(context, 0.6)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FaIcon(
            FontAwesomeIcons.calendarAlt,
            size: 14,
            color: Colors.black26,
          ),
          SizedBox(
            width: ResponsiveMethods.wp(context, 3),
          ),
          Text(
            'الاربعاء , 13 نيسان ,7:00 مساءا ',
            style: TextStyle(
              color: Colors.black26,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Padding buildEventTag(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: ResponsiveMethods.wp(context, 4),
          top: ResponsiveMethods.hp(context, 0.7)),
      child: Text(
        '# موسيقي',
        style: TextStyle(
          color: Colors.black26,
          fontSize: 14,
        ),
      ),
    );
  }

  Padding buildEventTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: ResponsiveMethods.wp(context, 4),
      ),
      child: Text(
        'الأسم الكامل للدوره بشكل افتراضي من أجل أظهار شكل التصميم',
        style: TextStyle(
            color: Colors.black38,
            fontSize: 17,
            height: 1,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
