import 'package:akashjan/screens/game_play_screen.dart';
import 'package:akashjan/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  runApp(const AkashJanGame());
}

class AkashJanGame extends StatelessWidget {
  const AkashJanGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akash Jan',
      //home: MainGamePageScreen(),
      home: StartScreen(),
    );
  }
}
