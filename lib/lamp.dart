import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Lamp extends GameDecoration with Lighting {
  Lamp(Vector2 position)
      : super (

    size: Vector2(32,32),
    position: position,
  ){
    setupLighting(
      LightingConfig(
        radius: TileSize,
        color: Colors.amber.withOpacity(0.3),
        withPulse: true,
        pulseVariation: 0.4
        // blurBorder: 20, // this is a default value
        // type: LightingType.circle, // this is a default value
        // useComponentAngle: false, // this is a default value. When true light rotate together component when change `angle` param.
      ),
    );
  }

}