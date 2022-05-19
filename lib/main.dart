import 'package:bonfire/bonfire.dart';
import 'package:bonfire_projeto/bandit.dart';
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
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.arrows
        ),
        directional: JoystickDirectional(
          color: Colors.black12,
        ),
        actions: [
          JoystickAction(
              actionId: 1,
              color: Colors.black12,
              margin: const EdgeInsets.all(40),
          ),]),



      map: TiledWorldMap(
        'map/floresta.json',
        objectsBuilder: {
          'bandit':(properties)=>Bandit(properties.position)
        },
        forceTileSize:   Size(TileSize,TileSize),
      ),
      player:  Personagem(Vector2(14*TileSize,14*TileSize),
      ),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 1.7,
        smoothCameraEnabled: true,
        smoothCameraSpeed: 4,

        sizeMovementWindow: Vector2(
            TileSize * 2,
            TileSize * 2,
        ),
      ),
      lightingColorGame: Colors.black.withOpacity(0.8),

    );
  }
}

