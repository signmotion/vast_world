part of '../../../vast_world.dart';

/// Component that contains a [defaults] value instead of null.
/// See [ValueComponent] from Oxygen.
abstract class VComponent<T> extends Component<T> {
  late final T value;

  String get hid =>
      runtimeType.toString().replaceFirst('Component', '').toLowerCase();

  /// This method call a chain: [initv] -> [check] for non-null [v] or
  /// set [value] to [defaults].
  /// ! For initialize own [value] just override [initv] and [check].
  @override
  void init([T? v]) {
    if (v == null) {
      value = defaults;
      return;
    }

    initv(v);

    check();
  }

  @protected
  void initv(T v) => value = v;

  /// We can call [check] after [init] for verify filled values.
  void check() {}

  @override
  void reset() => value = defaults;

  T get defaults => empty;

  /// Empty value for [T].
  T get empty;

  bool get isDefaults => value == defaults;

  bool get isEmpty => defaults == empty;
}
