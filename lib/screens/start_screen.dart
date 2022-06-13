import 'dart:html';
import 'dart:ui';

import 'package:akashjan/screens/game_play_screen.dart';
import 'package:akashjan/screens/selection_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:akashjan/constants/Dimens.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/main_home_page_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: MediaQuery.of(context).size.width/6),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('images/ic_main_logo.png',width: MediaQuery.of(context).size.width/2,),
                  SizedBox(height:40),
                  GestureDetector(
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SelectionScreen()),
                      );
                    } ,
                    child: Image.asset('images/menus/play.png',width: menuHeight)
                  ),
                  Image.asset('images/menus/options.png',width: menuHeight),
                  Image.asset('images/menus/credits.png',width: menuHeight),
                  Image.asset('images/menus/about.png',width: menuHeight),
                  Image.asset('images/menus/exit.png',width: menuHeight),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
