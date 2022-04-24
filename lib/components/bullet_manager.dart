import 'package:akashjan/components/bullet.dart';
import 'package:flame/components.dart';

class BulletManager extends Component with HasGameRef{
  late Timer _timer;
  Vector2 _playersPosition;

  BulletManager(this._playersPosition):super(){
    _timer = Timer(0.5,onTick: _triggerNewBullet,repeat: true);
  }

  void _triggerNewBullet() async{
    Sprite _bulletSprite = await gameRef.loadSprite('blue_lvl_1.png');
    _bulletSprite.srcSize = Vector2.all(126);
    Bullet bullet = Bullet(
        sprite: _bulletSprite,
        size: Vector2(32,32),
        position: _playersPosition
    );
    bullet.anchor = Anchor.center;
    add(bullet);
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

  set playersPosition(Vector2 value) {
    _playersPosition = value;
  }
}