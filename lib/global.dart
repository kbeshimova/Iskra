import 'package:flutter/material.dart';

var pink = Color(0xffFD2E71);
var orange = Color(0xffFF5A3D);
var white = Color.fromARGB(255, 255, 255, 255);
var black = Color.fromARGB(255, 0, 0, 0);
var red = Color(0xffD62D30);
var blue = Color(0xff17A2E3);
var green = Color(0xff17B440);
var gray = Color(0xffEEEEEE);
var lightGray = Color(0xffF0F0F0);

var primaryGradient = LinearGradient(
  colors: [
    pink,
    orange,
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

var mediumText = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: black,
);
var mediumTitle = TextStyle(
  fontSize: 21,
  fontWeight: FontWeight.w700,
  color: Color(0xff333333),
);
var highlightedText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: orange,
);
var buttonText = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w700,
  color: white,
);
var smallTitle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w700,
  color: lightGray,
);
var smallText = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w400,
  color: white,
);
var xsText = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w700,
  color: black,
);
