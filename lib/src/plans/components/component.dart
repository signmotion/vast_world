part of '../../../vast_world.dart';

/// Component that contains a [defaults] value instead of null.
/// See [ValueComponent] from Oxygen.
abstract class Component<T> extends oxygen.Component<T> with HasStringIdMix {
  /// [value] converted to [ComponentBase].
  ComponentBase get base => ComponentBase(
        hid: hid,
        uid: uid,
        sjsonValue: valueAsJson.sjson,
      );

  late T _value;

  T get value => _value;

  set value(T? v) {
    _value = v ?? defaults;
    if (v != null) {
      check();
    }
  }

  @override
  String get hid =>
      runtimeType.toString().replaceFirst('Component', '').toLowerCase();

  /// Should be implemented for each descendant.
  @override
  String get uid =>
      throw UnimplementedError('UID should be defined for this component.'
          ' Use UID genearator.'
          'For example, https://uuidgenerator.net');

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

  /// We can call [check] after [init] for verify values.
  void check() {}

  @override
  void reset() => _value = defaults;

  T get defaults => empty;

  /// Empty value for [T].
  T get empty;

  bool get isDefaults => _value == defaults;

  bool get isEmpty => _value == empty;

  JsonMap get valueAsJson;

  T jsonAsValue(JsonMap json);

  JsonMap get baseAsJson => base.toProto3Json() as JsonMap;

  /// See [base].
  /// See [jsonAsComponentBase].
  ComponentBase jsonAsBase(JsonMap json) => jsonAsComponentBase(json);

  @override
  String toString() => '$id $valueAsJson'.bittenOfAllUuids32.abbreviate(120);
}

ComponentBase jsonAsComponentBase(JsonMap json) => switch (json) {
      {
        'hid': String? hid,
        'uid': String? uid,
        'valueAsJson': Map<String?, Object?> valueAsJson,
      } =>
        ComponentBase(
          hid: hid,
          uid: uid,
          sjsonValue: valueAsJson.sjson,
        ),
      _ => throw ArgumentError(json.sjson),
    };
