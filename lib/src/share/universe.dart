// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world_share.dart';

class Universe {
  Universe() {
    inner = oxygen.World();
    _queryManager = oxygen.QueryManager(inner.entityManager);
  }

  //static Universe defaults = Universe();

  late final oxygen.World inner;

  void registerSystem<T extends oxygen.System>(T system) =>
      inner.registerSystem(system);

  void registerComponent<C extends Component<V>, V>(
    oxygen.ComponentBuilder<C> builder,
  ) =>
      inner.registerComponent(builder);

  /// Retrieve an entity with [id] equals [hid] or [uid] from [Plan] [IdComponent].
  oxygen.Entity? entity(String id) =>
      query([oxygen.Has<IdComponent>()]).entities.firstWhereOrNull((e) =>
          e.get<IdComponent>()!.hid == id || e.get<IdComponent>()!.uid == id);

  oxygen.Entity construct([String? id]) => inner.createEntity(id);

  /// Immediately remove [entity].
  void removeEntity(oxygen.Entity entity) => inner.entityManager
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
  oxygen.Query query(Iterable<oxygen.Filter> filters) =>
      _queryManager.createQuery(filters);

  late final oxygen.QueryManager _queryManager;
}
