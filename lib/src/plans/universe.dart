// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

class Universe {
  final universe = World();

  World get u => universe;

  void system<T extends System>(T system) => u.registerSystem(system);

  void component<T extends Component<V>, V>(ComponentBuilder<T> builder) =>
      u.registerComponent(builder);

  Entity construct([String? name]) => u.createEntity(name);
}
