import 'package:flutter/material.dart';
import 'package:practicalassignment1/pages/mainpage.dart';
import 'package:rive/rive.dart';
import 'package:practicalassignment1/libs/data.dart';

class Game {
  static int currentPlayer = 0;
  static var players = [Player(), Player()];
  static late Function refreshPage;
  static bool isPlaying = false;
  static void resetPlayers() {
    currentPlayer = 0;
    players[0].name = "Player 1";
    players[0].health = 15;
    players[0].mana = 15;
    players[0].color = Colors.blue;

    players[1] = Player();
    players[1].name = "Player 2";
    players[1].health = 15;
    players[1].mana = 15;
    players[1].color = Colors.red;
    for (int i = 0; i < 2; i++) {
      players[i].attack1Controller = OneShotAnimation(
        'Attack1',
        autoplay: false,
        onStop: () {
          isPlaying = false;
          refreshPage();
        },
        onStart: () {
          isPlaying = true;

          players[currentPlayer].mana -= 3;
          currentPlayer = currentPlayer == 0 ? 1 : 0;
          int _dmg = 3;
          if (players[currentPlayer].hasShield) {
            _dmg = 1;
            players[currentPlayer].hasShield = false;
          }
          players[currentPlayer].health -= _dmg;
          refreshPage();
        },
      );
      players[i].attack2Controller = OneShotAnimation(
        'Attack2',
        autoplay: false,
        onStop: () => {
          isPlaying = false,
          refreshPage(),
        },
        onStart: () {
          isPlaying = true;

          players[currentPlayer].mana -= 3;
          currentPlayer = currentPlayer == 0 ? 1 : 0;
          int _dmg = 3;
          if (players[currentPlayer].hasShield) {
            _dmg = 1;
            players[currentPlayer].hasShield = false;
          }
          players[currentPlayer].health -= _dmg;
          refreshPage();
        },
      );
    }
  }

  static void attack() {
    int _k = useFull.randomInt(0, 1);
    print(_k);
    if (_k == 0) {
      players[Game.currentPlayer].attack1Controller.isActive = true;
    } else {
      players[Game.currentPlayer].attack2Controller.isActive = true;
    }
    refreshPage();
  }

  static void heal() {
    players[currentPlayer].mana -= 5;
    players[currentPlayer].health += 3;
    if (players[currentPlayer].health > 15) {
      players[currentPlayer].health = 15;
    }
    currentPlayer = currentPlayer == 0 ? 1 : 0;
    refreshPage();
  }

  static void defense() {
    players[currentPlayer].mana -= 4;
    players[currentPlayer].hasShield = true;
    currentPlayer = currentPlayer == 0 ? 1 : 0;

    refreshPage();
  }

  static void skip() {
    int _mn = 3;
    if (players[currentPlayer].mana <= 0) {
      _mn = 2;
    }
    players[currentPlayer].mana += _mn;
    currentPlayer = currentPlayer == 0 ? 1 : 0;
    refreshPage();
  }
}

class Player {
  String name = "Player";
  int health = 15;
  int mana = 15;
  bool isBot = false;

  Color color = Colors.red;

  bool hasShield = false;

  late RiveAnimationController attack1Controller;
  late RiveAnimationController attack2Controller;
}
