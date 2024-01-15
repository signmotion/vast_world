part of '../../../vast_world.dart';

class ServiceSystem extends System {
  @override
  void init() {}

  @override
  void execute(double delta) {}

  void addToListComponent<C extends VComponent<dynamic>>(C component) {
    final query = createQuery([
      Has<ListComponent<C>>(),
    ]);
    for (final e in query.entities) {
      final cv = e.get<C>()!.value as List<C>;
      cv.add(component);
      print(cv);
    }
  }
}
