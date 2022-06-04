import 'dart:async';
import 'dart:math';

import 'package:akashjan/components/enemy.dart';
import 'package:akashjan/constants/Constants.dart';
import 'package:akashjan/screens/game_page.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:akashjan/constants/Constants.dart';
import 'explossion.dart';

class EnemyManager extends Component with HasGameRef<GamePage>{
  late Timer _timer;
  EnemyManager():super(){
    _timer = Timer(1,onTick: _spawnEnemy,repeat: true);
  }

  Random _random = Random();

  void _spawnEnemy() async{
    Vector2 position = Vector2(_random.nextDouble()*gameRef.size.x,0);
    SpriteAnimation enemyAnimation = await _getEnemy1();
    Enemy enemy = Enemy(position,enemyAnimation,_onEnemyCollision);
    add(enemy);
  }
  @override
  void onMount() {
    super.onMount();
    _timer.start();
  }
  @override
  void onRemove() {
    super.onRemove();
    _timer.stop();
  }
  @override
  void update(double dt) {
    super.update(dt);
    _timer.update(dt);
  }

  Future<SpriteAnimation> _getEnemy1() async{
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('enemy_1.png'),
      srcSize: Vector2(1024, 1024),
    );
    return spriteSheet.createAnimation(row: 0, stepTime: enemy1AnimationSpeed, to: 3);
  }

  void _onEnemyCollision(Vector2 point) async{
    final spriteSheet = SpriteSheet(
        image: await gameRef.images.load('explossion_2.png'),
        srcSize: Vector2(96, 96),
    );
    var explossionAnimation = spriteSheet.createAnimation(row: 0, stepTime: explossionSpeed, to: 17,loop: false);
    Explossion explossion = Explossion(point-Vector2(35,22), explossionAnimation);
    add(explossion);
  }
}