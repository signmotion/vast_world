part of '../../vast_world.dart';

class Cell1DContent<T> extends Content {
  Cell1DContent({
    required int length,
    required this.defaults,
    List<T>? data,
  }) {
    this.data = data ?? List<T>.filled(length, defaults);
  }

  late final List<T> data;

  final T defaults;

  @override
  bool isEmpty() => data.firstWhereOrNull((e) => e != defaults) != null;

  int index(List<int> li) => li.single;

  T operator [](int ci) => data[index([ci])];

  void operator []=(int ci, T v) => data[index([ci])] = v;
}
