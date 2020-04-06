import 'package:carousel_slider/carousel_slider.dart';
import 'package:events_app/utilities/ResponsiveMethods.dart';
import 'package:flutter/material.dart';

class CuroselIndicatior extends StatefulWidget {
  final List imgList;
  CuroselIndicatior({Key key, @required this.imgList}) : super(key: key);

  @override
  _CuroselIndicatiorState createState() => _CuroselIndicatiorState();
}

class _CuroselIndicatiorState extends State<CuroselIndicatior> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarouselSlider(
          height: ResponsiveMethods.hp(context, 29.7),
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
          items: widget.imgList.map((i) {
            print("http${i.substring(5)}");
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  // margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.purple),
                  child: Image.network("http${i.substring(5)}",
                      fit: BoxFit.fill, width: 150000.0),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
            // top: 0.0,
            left: ResponsiveMethods.wp(context, 3.2),
            bottom: ResponsiveMethods.hp(context, 1.2),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imgList.map((element) {
                  return Builder(
                    builder: (BuildContext context) {
                      var index = widget.imgList.indexOf(element);

                      return AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: _current == index
                            ? ResponsiveMethods.wp(context, 2.8)
                            : ResponsiveMethods.wp(context, 1.9),
                        height: _current == index
                            ? ResponsiveMethods.wp(context, 2.8)
                            : ResponsiveMethods.wp(context, 1.9),
                        margin: EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Color.fromRGBO(255, 255, 255, 0.9)
                                : Color.fromRGBO(255, 255, 255, 0.4)),
                      );
                    },
                  );
                }).toList()))
      ],
    );
  }
}
