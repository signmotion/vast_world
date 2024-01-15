part of '../../vast_world.dart';

class Cell2DContent<T> extends Cell1DContent<T> {
  Cell2DContent({
    required this.size,
    required super.defaults,
    super.data,
  }) : super(length: size.$1 * size.$2);

  final (int, int) size;

  int get width => size.$1;
  int get height => size.$2;

  @override
  int index(List<int> li) => li.first + li.last * width;

  // @override
  // dynamic operator []((int, int) ti) {
  //   final (k, l) = clampAxisTypes(ti);

  //   return outside(k, l) ? outerDataDefaultValue : data[index(k, l)];
  // }

  // @override
  // void operator []=((int, int) ti, dynamic v) {
  //   final (k, l) = clampAxisTypes(ti);

  //   if (inside(k, l)) {
  //     data[index(k, l)] = v as T;
  //   }
  // }
}
