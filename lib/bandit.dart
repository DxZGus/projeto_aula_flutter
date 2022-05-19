import 'package:bonfire/bonfire.dart';
import 'package:bonfire_projeto/main.dart';
import 'package:bonfire_projeto/bandit_sprite_sheet.dart';
import 'package:bonfire_projeto/personagem_principal.dart';
import 'package:bonfire_projeto/player_sprite_sheets.dart';
import 'package:flutter/cupertino.dart';

class Bandit extends SimpleEnemy with ObjectCollision {

  bool canMove = true;

  Bandit(Vector2 position)
      : super(
    size: Vector2(TileSize, TileSize),
    position: position,
    animation: SimpleDirectionAnimation(
      idleLeft: BanditSpriteSheet.banditIdleLeft,
      idleRight: BanditSpriteSheet.banditIdleRight,
      runRight: BanditSpriteSheet.banditRunRight,
      runLeft: BanditSpriteSheet.banditRunLeft,
    ),
    speed: 35,
    life: 100,

  ) {
    setupCollision(
        CollisionConfig(
          collisions: [
            CollisionArea.rectangle(
              size: Vector2(16, 16),
              align: Vector2(4, 10),


            ),
          ],
        )
    );
  }

  @override
  void update(double dt) {
    if (canMove) {
      seeAndMoveToPlayer(closePlayer: (Personagem) {
        _executeAttack();
      },
        radiusVision: TileSize * 3,
        margin: 4,
      );
    }

    super.update(dt);
  }

  @override
  void _executeAttack() {
    simpleAttackMelee(
      damage: 20,
      size: Vector2(TileSize * 0.7, TileSize * 0.7),
      sizePush: TileSize * 0.5,
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
      animation?.playOnce(BanditSpriteSheet.receiveDamageLeft,
          runToTheEnd: true,
          onFinish: () {
            canMove = true;
          }

      );
    } else {
      animation?.playOnce(BanditSpriteSheet.receiveDamageRight,
          runToTheEnd: true,
          onFinish: () {
            canMove = true;
          }
      );
    }
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      borderWidth: 2,
      height: 1,
      align: const Offset(0, -5),

    );
    super.render(canvas);
  }

  @override
  void die() {

    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(BanditSpriteSheet.deadLeft,
          runToTheEnd: true,
          onFinish: () {
            removeFromParent();
          }

      );
    } else {
      animation?.playOnce(BanditSpriteSheet.deadRight,
          runToTheEnd: true,
          onFinish: () {
            removeFromParent();
          }
      );

      super.die();
    }
  }
}
