// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

class Universe {
  Universe() {
    inner = World();
    _queryManager = QueryManager(inner.entityManager);
  }

  late final World inner;

  void registerSystem<T extends System>(T system) =>
      inner.registerSystem(system);

  void registerComponent<T extends Component<V>, V>(
    ComponentBuilder<T> builder,
  ) =>
      inner.registerComponent(builder);

  /// Retrieve an entity with [id] equals [hid] or [uid] from [Plan] [IdComponent].
  Entity? entity(String id) =>
      query([Has<IdComponent>()]).entities.firstWhereOrNull((e) =>
          e.get<IdComponent>()!.hid == id || e.get<IdComponent>()!.uid == id);

  Entity construct([String? id]) => inner.createEntity(id);

  /// Immediately remove [entity].
  void removeEntity(Entity entity) => inner.entityManager
    ..removeEntity(entity)
    ..processRemovedEntities();

  JsonMap toJson() => <String, dynamic>{
        'entity_count': inner.entities.length,
        'entity_list': inner.entities.map((e) => e.name),
        'system_count': inner.systemManager.systems.length,
        'system_list': inner.systemManager.systems.map((s) => s.runtimeType),
      };

  @override
  String toString() => toJson().sjson;

  /// Create or retrieve a cached query.
  Query query(Iterable<Filter> filters) => _queryManager.createQuery(filters);

  late final QueryManager _queryManager;
}
