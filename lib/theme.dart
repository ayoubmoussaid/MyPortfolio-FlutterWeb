import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  appBarTheme: AppBarTheme(color: Colors.transparent),
  backgroundColor: Color(0xffffffff),
  primaryColor: Color(0xff214eef),
  //primarySwatch: Color(0xffeb5286),
  accentColor: Color(0xffE91E63), //pink
  textTheme: TextTheme(
      headline1:
          TextStyle(color: Color(0xff141414), fontFamily: 'Lato', fontWeight: FontWeight.bold)),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

//TODO change colors, as evreything is messed up
