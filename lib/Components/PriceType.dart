import 'package:flutter/material.dart';

class PriceType extends StatelessWidget {
  final String type;
  final double price;
  const PriceType({
    Key key,
    @required this.type,
    @required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          this.type,
          style: TextStyle(color: Colors.black26, fontSize: 13, height: 1),
        ),
        Text(
          '$price SAR',
          style: TextStyle(color: Colors.black26, fontSize: 13, height: 1),
        )
      ],
    );
  }
}
