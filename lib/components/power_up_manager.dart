import 'dart:math';

import 'package:akashjan/components/power_up.dart';
import 'package:akashjan/screens/game_page.dart';
import 'package:akashjan/constants/enums.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class PowerUpManager extends Component with HasGameRef<GamePage>{
  late Timer _timer;
  PowerUps? _powerups;
  final double _powerUpSpeedAnimationSpeed = 0.05;
  PowerUpManager():super(){
    _timer = Timer(10,onTick: _spawnPowerUps,repeat: true);
  }

  final Random _random = Random();

  void _spawnPowerUps() async{
    Vector2 position = Vector2(_random.nextDouble()*gameRef.size.x,0);
    SpriteAnimation enemyAnimation = await _getBulletPowerUp();
    PowerUp powerUp = PowerUp(position,enemyAnimation,_onPlayersCollision);
    add(powerUp);
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

  Future<SpriteAnimation> _getBulletPowerUp() async{
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('powerUps/pUp-1.png'),
      srcSize: Vector2(93, 58),
    );
    _powerups = PowerUps.bulletSpeed;
    return spriteSheet.createAnimation(row: 0, stepTime: _powerUpSpeedAnimationSpeed, to: 4);
  }

  void _onPlayersCollision(Vector2 point) async{
    //TODO(INCASE FUTURE NEEDS)
  }

  PowerUps? get powerups => _powerups;
}