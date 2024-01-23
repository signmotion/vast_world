part of '../../../vast_world.dart';

/// Component that contains a [defaults] value instead of null.
/// See [ValueComponent] from Oxygen.
abstract class VComponent<T> extends Component<T> {
  late T _value;

  T get value => _value;

  set value(T? v) {
    _value = v ?? defaults;
    if (v != null) {
      check();
    }
  }

  String get hid =>
      runtimeType.toString().replaceFirst('Component', '').toLowerCase();

  /// This method call a chain: [initv] -> [check] for non-null [v] or
  /// set [value] to [defaults].
  /// ! For initialize own [value] just override [initv] and [check].
  @override
  void init([T? v]) {
    if (v == null) {
      _value = defaults;
      return;
    }

    initv(v);

    check();
  }

  @protected
  void initv(T v) => _value = v;

  /// We can call [check] after [init] for verify filled values.
  void check() {}

  @override
  void reset() => _value = defaults;

  T get defaults => empty;

  /// Empty value for [T].
  T get empty;

  bool get isDefaults => _value == defaults;

  bool get isEmpty => _value == empty;
}
