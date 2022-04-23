import 'package:akashjan/screens/game_page.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MainGamePageScreen extends StatefulWidget {
  const MainGamePageScreen({Key? key}) : super(key: key);

  @override
  _MainGamePageScreenState createState() => _MainGamePageScreenState();
}

class _MainGamePageScreenState extends State<MainGamePageScreen> {
  GamePage game = GamePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        body: Stack(
          children: [
            GameWidget(game: game),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(),
            )
          ],
        ));
  }
}
