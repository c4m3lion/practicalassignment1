// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:practicalassignment1/libs/data.dart';
import 'package:practicalassignment1/pages/choosemodepage.dart';
import 'package:practicalassignment1/pages/mainpage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: AppBarTheme(color: MyColors.appbar, centerTitle: true),
      scaffoldBackgroundColor: MyColors.background,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyColors.green),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(
                width: 0.0,
              ),
            ),
          ),
        ),
      ),
    ),
    initialRoute: '/mode',
    routes: {
      '/mainmenu': (context) => MainMenuPage(),
      '/mode': (context) => ChooseModePage(),
    },
  ));
}
