part of '../../vast_world.dart';

/// This shape includes all inside.
class InfinityShape extends Shape2D {
  const InfinityShape();

  @override
  bool inside(num x, num y) => true;

  @override
  List<Object?> get props => [...super.props];
}
