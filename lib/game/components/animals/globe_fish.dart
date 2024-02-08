import 'package:flame/game.dart';
import 'package:plasticdiver/game/components/animals/animal.dart';

class GlobeFish extends Animal {
  GlobeFish({
    super.isGoingRight,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'globe-fish.png';

  @override
  Vector2 get floatingVelocity => Vector2(20, 30);
}
