import 'package:bonfire/bonfire.dart';
import 'package:bonfire_projeto/main.dart';
import 'package:bonfire_projeto/player_sprite_sheets.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class Personagem extends SimplePlayer with ObjectCollision,Lighting{
  bool canMove= true;
  Personagem(Vector2 position)
      : super(size: Vector2(TileSize,TileSize),
      position: position,
       animation:SimpleDirectionAnimation(
           idleLeft: PlayerSpriteSheet.heroIdleLeft,
           idleRight: PlayerSpriteSheet.heroIdleRight,
           runRight: PlayerSpriteSheet.heroRunRight,
           runLeft: PlayerSpriteSheet.heroRunLeft,
       ),
    speed: 70,


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
    setupLighting(LightingConfig(
        radius: TileSize * 1,
        color: Colors.transparent,
        blurBorder: TileSize * 1,
    ),
    );
  }

  @override
  void update(double dt) {

    super.update(dt);
  }
  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if(canMove) {
      super.joystickChangeDirectional(event);
    }
  }
  @override
  void joystickAction(JoystickActionEvent event) {
    if(event.event == ActionEvent.DOWN && event.id==1 || event.id==LogicalKeyboardKey.space) {
      _executeAttack();

      
    }super.joystickAction(event);
  }


  void _executeAttack(){
    simpleAttackMelee(damage: 20,
      size:Vector2(TileSize *0.7, TileSize * 0.7),
      sizePush: TileSize *0.5,
      animationDown: PlayerSpriteSheet.attackBottom,
      animationLeft: PlayerSpriteSheet.attackLeft,
      animationRight: PlayerSpriteSheet.attackRight,
      animationUp: PlayerSpriteSheet.attackTop,


    );
  }
  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    canMove = false;
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(PlayerSpriteSheet.receiveDamageLeft,
          runToTheEnd: true,
          onFinish: () {
            canMove = true;
          }

      );
    } else {
      animation?.playOnce(PlayerSpriteSheet.receiveDamageRight,
          runToTheEnd: true,
          onFinish: () {
            canMove = true;
          }
      );
    }
    super.receiveDamage(attacker, damage, identify);
  }


  void onTap(){
    TalkDialog.show(context, [
      Say(
        text:[
          const TextSpan(text: 'e esse é o meu projeto de flutter'),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: PlayerSpriteSheet.heroIdleRight.asWidget(),

    ),

      ),]);
  }

  @override
  void die() {

    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(PlayerSpriteSheet.deadLeft,
          runToTheEnd: true,
          onFinish: () {
            removeFromParent();
          }

      );
    } else {
      animation?.playOnce(PlayerSpriteSheet.deadRight,
          runToTheEnd: true,
          onFinish: () {
            removeFromParent();

          }
      );

      super.die();
    }
  }







}