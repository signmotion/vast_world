// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

class Universe {
  final inner = World();

  void registerSystem<T extends System>(T system) =>
      inner.registerSystem(system);

  void registerComponent<T extends Component<V>, V>(
    ComponentBuilder<T> builder,
  ) =>
      inner.registerComponent(builder);

  Entity construct([String? id]) => inner.createEntity(id);

  JsonMap toJson() => <String, dynamic>{
        'entity_count': inner.entities.length,
        'entity_list': inner.entities.map((e) => e.name),
        'system_count': inner.systemManager.systems.length,
        'system_list': inner.systemManager.systems.map((s) => s.runtimeType),
      };

  @override
  String toString() => toJson().sjson;
}
