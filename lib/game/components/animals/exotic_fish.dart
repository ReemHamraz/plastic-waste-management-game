import 'package:flame/game.dart';
import 'package:plasticdiver/game/components/animals/animal.dart';

class ExoticFish extends Animal {
  ExoticFish({
    required super.isGoingRight,
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  static const double minDepth = 10;
  static const double maxDepth = 1000;

  @override
  double get animalWidth => 35;

  @override
  String get image => 'exotic_fish.png';

  @override
  Vector2 get floatingVelocity => Vector2(50, 0);
}
