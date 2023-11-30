import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter_flame_basic_app/components/santa_component.dart';
import 'package:flutter_flame_basic_app/constants/gobals.dart';
import 'package:flutter_flame_basic_app/games/gift_grab_game.dart';

class GiftComponent extends SpriteComponent
    with HasGameRef<GiftGrabGame>, CollisionCallbacks {
  final double _spriteHeight = 70;

  final Random _random = Random();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.giftSprite);
    height = width = _spriteHeight;
    position = _geRandomPosition();
    anchor = Anchor.center;

    add(CircleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is SantaComponent) {
      FlameAudio.play(Globals.itemGrabSound);
      removeFromParent();
      gameRef.score += 100;
      gameRef.add(GiftComponent());
    }
  }

  Vector2 _geRandomPosition() {
    double x = _random.nextInt(gameRef.size.x.toInt() - 50).toDouble();
    double y = _random.nextInt(gameRef.size.y.toInt() - 50).toDouble();
    return Vector2(x, y);
  }
}
