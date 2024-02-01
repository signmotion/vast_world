part of '../../../vast_world_share.dart';

/// List of [Plan] represents as [Component].
// typedef PlanListComponent = ListComponent<Plan>;

/// List of [P] represents as [Component].
// class PlanListComponent<P extends Plan> extends Component<List<P>> {
//   @override
//   String get uid => '01ee314e-a151-4a20-8e94-ea318ff08d05';

//   @override
//   List<P> get empty => <P>[];

//   void add(P v) => value.add(v);

//   @override
//   JsonMap get valueAsJson => {'value': value.map((v) => v.sjson).sjson};

//   @override
//   List<P> jsonAsValue(JsonMap json) => throw UnimplementedError();
// }

// class PlanListComponent<P extends Plan> extends ListComponent<P> {
//   @override
//   List<P> get empty => <P>[];
// }

/// List of [T] represents as [Component].
class ListComponent<T> extends Component<List<T>> {
  @override
  String get uid => '60fc6015-417e-4548-adaa-b032b1f7dbcd';

  @override
  List<T> get empty => <T>[];

  void add(T v) => value.add(v);

  @override
  JsonMap get valueAsJson => {'value': value.map((v) => (v as Object).sjson)};

  @override
  List<T> jsonAsValue(JsonMap json) => switch (json) {
        {'value': List<dynamic>? l} => (l ?? []).map((v) => v as T).toList(),
        _ => throw ArgumentError(json.sjson),
      };
}
