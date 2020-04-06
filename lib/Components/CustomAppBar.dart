import 'package:events_app/utilities/ResponsiveMethods.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final Function onFavPressed;
  final Function onSharePressed;
  final Function onBackPressed;
  const CustomAppBar({
    Key key,
    @required this.onFavPressed,
    @required this.onSharePressed,
    @required this.onBackPressed,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveMethods.hp(context, 13),
      width: ResponsiveMethods.wp(context, 100),
      color: Colors.transparent,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
              left: ResponsiveMethods.wp(context, 3.4),
              right: ResponsiveMethods.wp(context, 2)),
          child: Row(
            children: <Widget>[
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onFavPressed,
                  customBorder: CircleBorder(),
                  child: Icon(
                    Icons.star_border,
                    size: 22.4,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: ResponsiveMethods.wp(context, 3.4)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: widget.onSharePressed,
                        customBorder: CircleBorder(),
                        child: Icon(
                          Icons.share,
                          size: 22.4,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  customBorder: CircleBorder(),
                  onTap: widget.onBackPressed,
                  child: Icon(
                    Icons.chevron_right,
                    size: 22.4,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
