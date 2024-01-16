part of '../../../vast_world.dart';

/// List of [Plan] represents as [VComponent].
// typedef PlanListComponent = ListComponent<Plan>;

/// List of [P] represents as [VComponent].
class PlanListComponent<P extends Plan> extends VComponent<List<P>> {
  @override
  List<P> get empty => <P>[];

  void add(P v) => value.add(v);
}

// class PlanListComponent<P extends Plan> extends ListComponent<P> {
//   @override
//   List<P> get empty => <P>[];
// }

/// List of [T] represents as [VComponent].
class ListComponent<T> extends VComponent<List<T>> {
  @override
  List<T> get empty => <T>[];

  void add(T v) => value.add(v);
}
