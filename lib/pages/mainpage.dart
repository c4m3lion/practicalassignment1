// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:practicalassignment1/libs/gamefunctions.dart';
import 'package:rive/rive.dart';
import 'dart:math' as math;

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  /// Is the animation currently playing?

  Widget buildUpperBar() {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: 150,
                    height: 30,
                    color: Colors.grey,
                  ),
                  Container(
                    width: Game.players[0].health * 10,
                    height: 30,
                    color: Colors.red,
                  ),
                  Text("Helth"),
                ],
              ),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: 150,
                    height: 30,
                    color: Colors.grey,
                  ),
                  Container(
                    width: Game.players[0].mana * 10,
                    height: 30,
                    color: Colors.blue,
                  ),
                  Text("Mana"),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    width: 150,
                    height: 30,
                    color: Colors.grey,
                  ),
                  Container(
                    width: Game.players[1].health * 10,
                    height: 30,
                    color: Colors.red,
                  ),
                  Text("Helth"),
                ],
              ),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    width: 150,
                    height: 30,
                    color: Colors.grey,
                  ),
                  Container(
                    width: Game.players[1].mana * 10,
                    height: 30,
                    color: Colors.blue,
                  ),
                  Text("Mana"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBottomBar() {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          Expanded(
            child: Game.currentPlayer != 0
                ? Text("Player 2 turn")
                : Container(
                    color: Colors.blue,
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          height: 120,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () => {
                              Game.attack(),
                            },
                            child: Image.asset(
                              "assets/battle.png",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () => {
                              Game.defense(),
                            },
                            child: Image.asset(
                              "assets/security.png",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () => {
                              Game.heal(),
                            },
                            child: Image.asset(
                              "assets/patch.png",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () => {
                              Game.heal(),
                            },
                            child: Image.asset(
                              "assets/next.png",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            Game.players[0].name,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          Expanded(
            child: Game.currentPlayer != 1
                ? Text("Player 1 turn")
                : Container(
                    color: Colors.red,
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            Game.players[1].name,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () => {
                              Game.heal(),
                            },
                            child: Image.asset(
                              "assets/patch.png",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () => {
                              Game.defense(),
                            },
                            child: Image.asset(
                              "assets/security.png",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () => {
                              Game.attack(),
                            },
                            child: Image.asset(
                              "assets/battle.png",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }

  void calBack() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Game.refreshPage = calBack;
    Game.resetPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildUpperBar(),
          //GamePart
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: RiveAnimation.asset(
                      'assets/Jeff.riv',
                      animations: ['Idle'],
                      controllers: [
                        Game.players[0].attack1Controller,
                        Game.players[0].attack2Controller
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Transform(
                      alignment: Alignment.center, //Default is left
                      transform: Matrix4.rotationY(math.pi),
                      child: RiveAnimation.asset(
                        'assets/Jeff.riv',
                        animations: ['Idle'],
                        controllers: [
                          Game.players[1].attack1Controller,
                          Game.players[1].attack2Controller
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //BottomPart
          buildBottomBar(),
        ],
      ),
    );
  }
}
