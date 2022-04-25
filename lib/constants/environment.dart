import 'dart:ui';

import 'package:akashjan/constants/Colors.dart';

class Environment {
  static Environment? _instance;
  Environment._();
  static Environment get instance => _instance ??= Environment._();


  bool isHitBoxStrokeEnable = true;

  Paint getHitBoxStroke(){
    return Paint()
      ..color = colorYellow
      ..style = PaintingStyle.stroke;
  }
}