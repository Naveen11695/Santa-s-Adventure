import 'package:flame/components.dart';
import 'package:flutter_flame_basic_app/constants/gobals.dart';
import 'package:flutter_flame_basic_app/games/gift_grab_game.dart';

class BackgroundComponent extends SpriteComponent
    with HasGameRef<GiftGrabGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite(Globals.backgroundSprite);
    size = gameRef.size;
  }
}
