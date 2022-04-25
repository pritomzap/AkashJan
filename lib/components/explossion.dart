import 'dart:ui';

import 'package:akashjan/constants/Dimens.dart';
import 'package:akashjan/constants/environment.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';

class Explossion extends SpriteAnimationComponent with HasGameRef,HasHitboxes{
  Explossion(this._exPosition,this._spriteAnimation) : super(size: enemy_1_size);
  Vector2 _exPosition;
  SpriteAnimation _spriteAnimation;
  final _shape = HitboxCircle(normalizedRadius: 0.5);

  @override
  void onMount() {
    // TODO: implement onMount
    super.onMount();
    addHitbox(_shape);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    position = _exPosition;
    _spriteAnimation.onComplete = _onAnimationComplete;
    animation = _spriteAnimation;
  }


  @override
  void update(double delta) {
    super.update(delta);
  }

  void _onAnimationComplete(){
    removeFromParent();
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
    try{
      _shape.render(canvas, Environment.instance.getHitBoxStroke());
    }catch(e){}
  }
}