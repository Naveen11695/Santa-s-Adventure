import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_basic_app/constants/gobals.dart';
import 'package:flutter_flame_basic_app/games/gift_grab_game.dart';

import 'menu/game_over_menu.dart';
import 'menu/main_menu.dart';

GiftGrabGame _giftGrabGame = GiftGrabGame();

enum Menu { main, gameOver }

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Globals.isTablet = MediaQuery.of(context).size.width > 600;

    return GameWidget(
      initialActiveOverlays: [Menu.main.name],
      game: _giftGrabGame,
      overlayBuilderMap: {
        Menu.gameOver.name: (BuildContext context, GiftGrabGame gameRef) =>
            GameOverMenu(gameRef: gameRef),
        Menu.main.name: (BuildContext context, GiftGrabGame gameRef) =>
            MainMenu(gameRef: gameRef),
      },
    );
  }
}
