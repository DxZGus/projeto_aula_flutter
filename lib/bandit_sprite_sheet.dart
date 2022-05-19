

import 'package:bonfire/bonfire.dart';

class BanditSpriteSheet{
  static Future<SpriteAnimation> get banditIdleLeft => SpriteAnimation.load(
    'bandit_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.2,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(96,0),
    ),
  );

  static Future<SpriteAnimation> get banditIdleRight => SpriteAnimation.load(
    'bandit_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(0,0),
    ),
  );
  static Future<SpriteAnimation> get banditRunRight => SpriteAnimation.load(
    'bandit_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(0,48),
    ),
  );
  static Future<SpriteAnimation> get banditRunLeft => SpriteAnimation.load(
    'bandit_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(96,48),
    ),
  );
  static Future<SpriteAnimation> get receiveDamageRight => SpriteAnimation.load(
    'bandit_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(0,96),
    ),
  );
  static Future<SpriteAnimation> get receiveDamageLeft => SpriteAnimation.load(
    'bandit_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(96,96),
    ),
  );
  static Future<SpriteAnimation> get deadRight => SpriteAnimation.load(
    'bandit_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(0,120),
    ),
  );
  static Future<SpriteAnimation> get deadLeft => SpriteAnimation.load(
    'bandit_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(96,120),
    ),
  );

}