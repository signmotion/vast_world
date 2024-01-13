part of '../../vast_world.dart';

class EmptyShape extends Shape2D {
  const EmptyShape();

  @override
  bool inside(num x, num y) => true;

  @override
  List<Object?> get props => [...super.props];
}
