import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class Lamp extends GameDecoration with Lighting {
  Lamp(Vector2 position,  Vector2 TileSize) : super
      (position: position, size: TileSize)

   {
    setupLighting(
      LightingConfig(
        radius: width * 1.5,
        blurBorder: width * 1.5,
        color: Colors.deepOrangeAccent.withOpacity(0.2),
      ),
    );
  }
}