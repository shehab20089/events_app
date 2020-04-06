import 'package:flutter/material.dart';

// used this file to add respoinsive desgin function in a resuable way
class ResponsiveMethods {
  static hp(BuildContext context, double percentage) {
    if (percentage <= 0)
      throw 'percentage can\'t be lower than or equal  zero ';

    return MediaQuery.of(context).size.height * percentage / 100;
  }

  static wp(BuildContext context, double percentage) {
    if (percentage <= 0)
      throw 'percentage can\'t be lower than or equal  zero ';

    return MediaQuery.of(context).size.width * percentage / 100;
  }
}
