import 'package:akashjan/components/Player.dart';
import 'package:akashjan/constants/enums.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


class GamePage extends FlameGame with HasDraggables{
  final Player _player = Player();

  @override
  Future<void>? onLoad() {
    add(_player);
    return super.onLoad();
  }
}