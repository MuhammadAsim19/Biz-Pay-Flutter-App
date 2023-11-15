import 'package:flutter/cupertino.dart';

mixin AppMedia {
  static MediaQueryData mediaQuery = const MediaQueryData();

   double get width => mediaQuery.size.width;

   double get height => mediaQuery.size.height;
   double get textScale => mediaQuery.textScaleFactor;

   double get devicePixel => mediaQuery.devicePixelRatio;
}