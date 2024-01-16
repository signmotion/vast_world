// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

class Universe {
  final universe = World();

  World get u => universe;

  void registerSystem<T extends System>(T system) => u.registerSystem(system);

  void registerComponent<T extends Component<V>, V>(
    ComponentBuilder<T> builder,
  ) =>
      u.registerComponent(builder);

  Entity construct([String? name]) => u.createEntity(name);

  VComponent<T> component<T extends VComponent<dynamic>>() =>
      u.entities.single.get<VComponent<T>>()!;

  ListComponent<T> listComponent<T>() =>
      u.entities.single.get<ListComponent<T>>()!;

  void add<T>(T entity) => listComponent<T>().add(entity);
}
