import 'dart:math';

import 'package:akashjan/components/Player.dart';
import 'package:akashjan/constants/enums.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../components/enemy.dart';
import '../components/enemy_manager.dart';
import '../components/enemy_sprite_animation.dart';


class GamePage extends FlameGame with HasDraggables{
  final Player _player = Player();
  @override
  Future<void>? onLoad() {
    //Enemy enemy = Enemy(Vector2(size.x/2,0));
    EnemyManager enemyManager = EnemyManager();
    add(_player);
    add(enemyManager);
    //add(enemy);
    return super.onLoad();
  }
}