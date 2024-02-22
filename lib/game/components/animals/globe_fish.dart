import 'package:flame/game.dart';
import 'package:plasticdiver/game/components/animals/animal.dart';

class GlobeFish extends Animal {
  GlobeFish({
    required super.isGoingRight,
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  static const double minDepth = 10;
  static const double maxDepth = 2000;

  @override
  double get animalWidth => 50;

  @override
  String get image => 'globe_fish.png';

  @override
  Vector2 get floatingVelocity => Vector2(20, 0);
}
