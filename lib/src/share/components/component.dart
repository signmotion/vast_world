part of '../../../vast_world_share.dart';

typedef AnyComponent = Component<dynamic>;

/// Component that contains a [defaults] value instead of null.
/// See [ValueComponent] from Oxygen.
abstract class Component<T> extends oxygen.Component<T>
    with HasProtoBaseMix, HasStringIdMix {
  Component() {
    _value = defaults;
  }

  /// [value] converted to [ComponentBase].
  @override
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

  @override
  bool get isCorrectHid => hid.isComponentHid;

  /// Should be implemented for each descendant.
  @override
  String get uid =>
      throw UnimplementedError('UID should be defined for this component.'
          ' Use UID genearator and set a prefic consider to [isComponentUid].'
          'For example, https://uuidgenerator.net');

  @override
  bool get isCorrectUid => uid.isComponentUid;

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

  @override
  bool operator ==(Object other) => other is Component<T> && base == other.base;

  @override
  int get hashCode => base.hashCode;

  JsonMap get valueAsJson;

  T jsonAsValue(JsonMap json);

  /// See [base].
  /// See [jsonAsComponentBase].
  @override
  ComponentBase jsonAsBase(JsonMap json) => jsonAsComponentBase(json);

  @override
  String toString() => '$runtimeType($valueAsJson)';
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
      _ => throw IllegalArgumentError('json', json.sjson, StackTrace.current),
    };
