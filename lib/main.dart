import 'package:bonfire/bonfire.dart';
import 'package:bonfire_projeto/personagem_principal.dart';
import 'package:flutter/material.dart';

final double TileSize = 32;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      joystick: Joystick(
        directional: JoystickDirectional(),
      ),
      map: TiledWorldMap(
        'map/floresta.json',
        forceTileSize:   Size(TileSize,TileSize),
      ),
      player:  Personagem(Vector2(14*TileSize,14*TileSize),
      ),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 2,
        sizeMovementWindow: Vector2(
            TileSize * 3,
            TileSize * 3,
        ),
      ),

    );
  }
}

