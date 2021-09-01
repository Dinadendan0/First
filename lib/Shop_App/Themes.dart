import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/const.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: HexColor('FF101A21'),
  appBarTheme: AppBarTheme(
    titleSpacing: 15,
    color: HexColor('FF101A21'),
    elevation: 0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('FF101A21'),
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah',

      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 100,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('FF071924'),
    selectedItemColor:defaultColor,
    //Colors.white,
    unselectedItemColor: HexColor('FF607479'),
    //elevation: 20,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    overline: TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    subtitle1 :TextStyle(
      fontSize: 16,
      color: Colors.black,
      height: 1.3,
      fontWeight: FontWeight.w500,

    ),


  ),
  fontFamily: 'Jannah',
);

ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      titleSpacing: 15,
      color: Colors.white,
      elevation: 0,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        fontFamily: 'Jannah',

        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 100,
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: defaultColor,
   // HexColor('FF33517B') ,
    unselectedItemColor: HexColor('FF607479'),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
      overline: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    subtitle1 :TextStyle(
      fontSize: 16,
      color: Colors.black,
      height: 1.3,
      fontWeight: FontWeight.w500,

    ),
  ),
  fontFamily: 'Jannah',



);