import 'package:flutter/material.dart';
import 'package:flutter_flame_basic_app/screens/game_play.dart';
import 'package:flutter_flame_basic_app/services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.openHiveBox(boxName: 'settings');

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GamePlay(),
    ),
  );
}
