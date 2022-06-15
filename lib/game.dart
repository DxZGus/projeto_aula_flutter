import 'package:bonfire/bonfire.dart';
import 'package:bonfire_projeto/bandit.dart';
import 'package:bonfire_projeto/game_controller.dart';
import 'package:bonfire_projeto/lamp.dart';
import 'package:bonfire_projeto/personagem_principal.dart';
import 'package:bonfire_projeto/player_overlay.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Game extends StatefulWidget {
  final int stage;
  const Game({Key? key, this.stage = 1}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  List<GameComponent> enemies = [];
  @override
  void initState(){
    switch(widget.stage){
      case 1:
        enemies.add(Bandit(_getWorldPosition(26,5)));
        break;
      case 2:
        enemies.add(Bandit(_getWorldPosition(26,5)));
        enemies.add(Bandit(_getWorldPosition(26,13)));
        break;
      case 3:
        enemies.add(Bandit(_getWorldPosition(26,5)));
        enemies.add(Bandit(_getWorldPosition(26,13)));
        enemies.add(Bandit(_getWorldPosition(32,8)));
        break;
      
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(

      joystick: Joystick(
          keyboardConfig: KeyboardConfig(
              keyboardDirectionalType: KeyboardDirectionalType.arrows
          ),
          directional: JoystickDirectional(
            color: Colors.blueGrey,
          ),
          actions: [
            JoystickAction(
              actionId: 1,
              color: Colors.blueGrey,
              margin: const EdgeInsets.all(40),
            ),]),



      map: TiledWorldMap(
        'map/floresta.json',
        objectsBuilder: {

          //'bandit':(properties)=>Bandit(properties.position),
          'lamp':(properties)=>Lamp(properties.position),

        },
        forceTileSize:   Size(TileSize,TileSize),
      ),
      player:  Personagem(Vector2(14*TileSize,14*TileSize),
      ),
      overlayBuilderMap: {
        'playerInterface':(context, game) =>PlayerInterface(game: game, )
      },
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
      ],
      components: [
        MyGameController(widget.stage),
        ...enemies,
      ],

      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 1.0,
        smoothCameraEnabled: true,
        smoothCameraSpeed: 4,

        sizeMovementWindow: Vector2(
          TileSize * 2,
          TileSize * 2,
        ),
      ),
      lightingColorGame: Colors.black.withOpacity(0.4),

    );
  }

  Vector2 _getWorldPosition(int x, int y) {
    return Vector2(x * TileSize, y * TileSize);
  }
}
