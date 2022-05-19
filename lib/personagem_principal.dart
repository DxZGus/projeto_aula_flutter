import 'package:bonfire/bonfire.dart';
import 'package:bonfire_projeto/main.dart';
import 'package:bonfire_projeto/sprite_sheets.dart';
import 'package:flutter/material.dart';

class Personagem extends SimplePlayer with ObjectCollision{
  Personagem(Vector2 position)
      : super(size: Vector2(TileSize,TileSize),
      position: position,
       animation:SimpleDirectionAnimation(
           idleLeft: GameSpriteSheet.heroIdleLeft,
           idleRight: GameSpriteSheet.heroIdleRight,
           runRight: GameSpriteSheet.heroRunRight,
           runLeft: GameSpriteSheet.heroRunLeft,
       ),
    speed: 100,


  ){
    setupCollision(
        CollisionConfig(
          collisions: [
            CollisionArea.rectangle(
                size: Vector2(16,16),
                align: Vector2(4,10),


            ),
          ],
        ),
    );
  }




}