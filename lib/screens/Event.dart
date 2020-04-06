//a folder to put all my app screens as here for Events page.
import 'package:events_app/Components/CustomAppBar.dart';
import 'package:events_app/Components/PriceType.dart';
import 'package:events_app/Components/curoselIndicatior.dart';
import 'package:events_app/Model/Event.Model.dart';
import 'package:events_app/Services/EventServices.dart';
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
  Future<Event> event;
  @override
  void initState() {
    super.initState();
    event = EventService.getEvent(6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomButton(context),
      backgroundColor: Colors.white,
      body: Container(
        child: FutureBuilder(
            future: event,
            builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
              if (snapshot.hasData) {
                return Stack(children: <Widget>[
                  SingleChildScrollView(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CuroselIndicatior(
                            imgList: snapshot.data.img,
                          ),
                          buildEventTag(context),
                          buildEventTitle(context),
                          buildEventDate(context),
                          buildEventLocation(context),
                          Divider(
                            color: Colors.black12,
                          ),
                          buildTrainerArea(context),
                          SizedBox(
                            height: ResponsiveMethods.hp(context, 1),
                          ),
                          Divider(
                            color: Colors.black12,
                          ),
                          buildAboutArea(context),
                          Divider(
                            color: Colors.black12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: ResponsiveMethods.hp(context, 0.2),
                              right: ResponsiveMethods.wp(context, 4),
                              left: ResponsiveMethods.wp(context, 4),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'تكلفه الدوره',
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 0.7),
                                ),
                                SizedBox(
                                  height: ResponsiveMethods.hp(context, 1),
                                ),
                                Column(
                                  children: <Widget>[
                                    PriceType(
                                      type: 'الحجز العادي',
                                      price: 40,
                                    ),
                                    SizedBox(
                                      height:
                                          ResponsiveMethods.hp(context, 0.8),
                                    ),
                                    PriceType(
                                      type: 'الحجز المميز',
                                      price: 80,
                                    ),
                                    SizedBox(
                                      height:
                                          ResponsiveMethods.hp(context, 0.5),
                                    ),
                                    PriceType(
                                      type: 'الحجز السريع',
                                      price: 120,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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
                ]);
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        child: CircularProgressIndicator(),
                        width: 45,
                        height: 45,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('...تحميل الصفخه'),
                      )
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }

  SizedBox buildBottomButton(BuildContext context) {
    return SizedBox(
      width: ResponsiveMethods.wp(context, 100),
      height: ResponsiveMethods.hp(context, 6.3),
      child: Material(
        color: Color(0xff813796),
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Text(
              'قم بالحجز الان',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildAboutArea(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ResponsiveMethods.hp(context, 0.6),
        right: ResponsiveMethods.wp(context, 4),
        left: ResponsiveMethods.wp(context, 4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'عن الدوره',
            style: TextStyle(
                color: Colors.black26,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 0.7),
          ),
          SizedBox(
            height: ResponsiveMethods.hp(context, 1),
          ),
          Text(
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحه, لقد تم توليد هذا النص من مولد النص العربي. حيث يمكنك ان تولد مثل هذا النص او العديد من النصوص الاخري اضافه الي زياده عدد الحروف التي يولدها التطبيق',
            style: TextStyle(
              color: Colors.black26,
              letterSpacing: 0.001,
              height: 1,
              fontSize: 14.80,
            ),
          )
        ],
      ),
    );
  }

  Padding buildTrainerArea(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: ResponsiveMethods.wp(context, 5),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 11,
              ),
              SizedBox(
                width: ResponsiveMethods.wp(context, 3),
              ),
              Text(
                'اسم المدرب',
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Text(
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحه, لقد تم توليد هذا النص من مولد النص العربي.',
            style: TextStyle(
              color: Colors.black26,
              letterSpacing: 0.0001,
              height: 1,
              fontSize: 12,
            ),
          )
        ],
      ),
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
            style: TextStyle(color: Colors.black26, fontSize: 13, height: 0.8),
          )
        ],
      ),
    );
  }

  Padding buildEventDate(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: ResponsiveMethods.wp(context, 4),
          top: ResponsiveMethods.hp(context, 0.7)),
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
              fontSize: 13,
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
