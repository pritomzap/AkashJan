import 'dart:math';
import 'dart:ui';

import 'package:akashjan/components/enemy.dart';
import 'package:akashjan/constants/environment.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:akashjan/constants/Colors.dart';

class Bullet extends SpriteComponent with HasHitboxes, Collidable{
  double bulletSpeed = 600;

  Bullet({
    Sprite? sprite,
    Vector2? position,
    Vector2? size
  }):super(sprite: sprite,position: position,size: size){
    angle = pi/2;
  }

  final HitboxCircle _shape = HitboxCircle(normalizedRadius: 0.2);

  @override
  void onMount() {
    super.onMount();
    if(Environment.instance.isHitBoxStrokeEnable)
      addHitbox(_shape);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    try{
      _shape.render(canvas, Environment.instance.getHitBoxStroke());
    }catch(e){}
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);
    if(other is Enemy){
      removeFromParent();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    this.position += Vector2(0,-1)*bulletSpeed*dt;
    if(this.position.y < 0){
      removeFromParent();
    }
  }

}