import 'package:akashjan/components/power_up.dart';
import 'package:akashjan/constants/enums.dart';
import 'package:akashjan/constants/environment.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart' hide Draggable;
import 'package:flame/input.dart';
import '../screens/game_page.dart';
import 'enemy.dart';

class Player extends SpriteAnimationComponent with HasGameRef,HasHitboxes,Draggable,Collidable{
  Player() : super(size: Vector2(283/3, 137/3)){
    addHitbox(HitboxRectangle());
  }

  Direction direction = Direction.none;
  late final SpriteAnimation _standingAnimation;
  final double _animationSpeed = 0.05;
  Vector2? dragDeltaPosition;
  final _shape = HitboxCircle(normalizedRadius: 0.5);
  Function? _onColideWithPowerUps = null;
  int _playerScore = 0;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    position = gameRef.size/2;
    _loadAnimations().then((_) => {animation = _standingAnimation});
  }
  @override
  void onMount() {
    // TODO: implement onMount
    super.onMount();
    if(Environment.instance.isHitBoxStrokeEnable)
      addHitbox(_shape);
  }

  @override
  void update(double delta) {
    super.update(delta);
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('b_17_type_1.png'),
      srcSize: Vector2(849, 411),
    );
    _standingAnimation = spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 3);
  }

  @override
  bool onDragStart(int pointerId, DragStartInfo info) {
    dragDeltaPosition = info.eventPosition.game - position;
    return false;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);
    if(other is PowerUp){
      _onColideWithPowerUps?.call();
    } else if(other is Enemy){
      final effect = OpacityEffect.to(0.5, EffectController(duration: 0.2,repeatCount: 3));
      add(effect);
    }
  }

  @override
  bool onDragUpdate(int pointerId, DragUpdateInfo info) {
    if (parent is! GamePage) {
      return true;
    }
    if(info.raw.globalPosition.dx >= size.x/2 && info.raw.globalPosition.dx <= (gameRef.size.x-size.x/2) &&
    info.raw.globalPosition.dy >= size.y/2 && info.raw.globalPosition.dy <= (gameRef.size.y-size.y/2)){
      final dragDeltaPosition = this.dragDeltaPosition;
      if (dragDeltaPosition == null) {
        return false;
      }
      position.setFrom(info.eventPosition.game - dragDeltaPosition);
      return false;
    }
    return true;
  }

  @override
  bool onDragEnd(int pointerId, DragEndInfo _) {
    dragDeltaPosition = null;
    return false;
  }

  @override
  bool onDragCancel(int pointerId) {
    dragDeltaPosition = null;
    return false;
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
    try{
      _shape.render(canvas, Environment.instance.getHitBoxStroke());
    }catch(e){}
  }

  set onColideWithPowerUps(Function value) {
    _onColideWithPowerUps = value;
  }

  int get playerScore => _playerScore;

  set playerScore(int value) {
    _playerScore = value;
  }
}