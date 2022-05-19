import 'package:bonfire/bonfire.dart';

class PlayerSpriteSheet{
  static Future<SpriteAnimation> get heroIdleLeft => SpriteAnimation.load(
    'fhero.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.2,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(96,0),
  ),
  );
  static Future<SpriteAnimation> get heroIdleRight => SpriteAnimation.load(
    'fhero.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(0,0),
  ),
  );
  static Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load(
    'fhero.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(0,48),
    ),
  );
  static Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load(
    'fhero.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(96,48),
    ),
  );
  static Future<SpriteAnimation> get attackLeft => SpriteAnimation.load(
    'atack_effect_left.png',
    SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.1,
      textureSize: Vector2(16,16),

    ),
  );
  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
    'atack_effect_right.png',
    SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.1,
      textureSize: Vector2(16,16),

    ),
  );
  static Future<SpriteAnimation> get attackTop => SpriteAnimation.load(
    'atack_effect_top.png',
    SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.1,
      textureSize: Vector2(16,16),

    ),
  );
  static Future<SpriteAnimation> get attackBottom => SpriteAnimation.load(
    'atack_effect_bottom.png',
    SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.1,
      textureSize: Vector2(16,16),

    ),
  );
  static Future<SpriteAnimation> get receiveDamageRight => SpriteAnimation.load(
    'fhero.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(0,96),
    ),
  );
  static Future<SpriteAnimation> get receiveDamageLeft => SpriteAnimation.load(
    'fhero.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(96,96),
    ),
  );
  static Future<SpriteAnimation> get deadRight => SpriteAnimation.load(
    'fhero.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(0,120),
    ),
  );
  static Future<SpriteAnimation> get deadLeft => SpriteAnimation.load(
    'fhero.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24,24),
      texturePosition: Vector2(96,120),
    ),
  );

}

