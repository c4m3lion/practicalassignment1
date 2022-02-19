// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:practicalassignment1/libs/gamefunctions.dart';

class ChooseModePage extends StatefulWidget {
  const ChooseModePage({Key? key}) : super(key: key);

  @override
  _ChooseModePageState createState() => _ChooseModePageState();
}

class _ChooseModePageState extends State<ChooseModePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              width: 200,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.pushReplacementNamed(context, '/mainmenu'),
                },
                child: Text(
                  "PvP",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              width: 200,
              child: ElevatedButton(
                onPressed: () => {},
                child: Text(
                  "PvB",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
