// ignore_for_file: inference_failure_on_function_invocation

part of '../../../vast_world_share.dart';

/// You should override [extendedFromBase], [extendedBuilders] and
/// [extendedRunForComponent] for construct own components.
class ComponentBuilder {
  const ComponentBuilder();

  C fromJson<C extends Component<dynamic>>(JsonMap json) =>
      fromBase(jsonAsComponentBase(json));

  /// See note for this class.
  C fromBase<C extends Component<dynamic>>(ComponentBase base) {
    logi('🧙‍♂️🟨 Constructing component based on'
            ' `${base.shortMapWithSignificantFieldsMessage}...'
        .bittenOfAllUuids32);

    late final Component<dynamic> component;
    try {
      component = _fromBase(base);
    } on UnimplementedError catch (_) {
      component = extendedFromBase(base);
    }

    logi('🧙‍♂️💚 Component `$component` constructed.');

    return component as C;
  }

  /// Will call after [fromBase].
  C extendedFromBase<C extends Component<dynamic>>(ComponentBase base) =>
      throw UnimplementedError(base.hid);

  C _fromBase<C extends Component<dynamic>>(ComponentBase base) {
    final component = builder(base.uid)();
    final json = base.sjsonValue.jsonMap;
    component.init(component.jsonAsValue(json));

    return component as C;
  }

  TBuilder<Component<dynamic>> builder(String componentUid) =>
      allBuilders.firstWhere(
        (cb) => cb().uid == componentUid,
        orElse: () => throw UnimplementedError(),
      );

  /// Register, add, update component by [componentUid] with [jsonValue].
  void add(
    String componentUid,
    Universe u,
    oxygen.Entity entity,
    JsonMap jsonValue,
  ) =>
      runForComponent(
        componentUid,
        u: u,
        entity: entity,
        jsonValue: jsonValue,
        run: <C extends Component<dynamic>, T>(
          TBuilder<C> builder, {
          Universe? u,
          oxygen.Entity? entity,
          T? value,
          dynamic accResult,
        }) {
          u!.registerComponent(builder);
          entity!.add<C, dynamic>(
            builder().jsonAsValue(jsonValue) as T,
          );
        },
      );

  /// All components of the [entity].
  List<Component<dynamic>> components(
    Universe u,
    oxygen.Entity entity,
  ) {
    Component<dynamic>? run<C extends Component<dynamic>, T>(
      TBuilder<C> builder, {
      Universe? u,
      oxygen.Entity? entity,
      T? value,
    }) =>
        // looking at concrete component
        entity!.get<C>();

    final r = <Component<dynamic>>[];
    for (final componentBuilder in allBuilders) {
      final found = runForComponent(
        componentBuilder().uid,
        u: u,
        entity: entity,
        run: run,
      );
      if (found != null) {
        r.add(found);
      }
    }

    return r;
  }

  List<TBuilder<Component<dynamic>>> get allBuilders =>
      [...nativeBuilders, ...extendedBuilders];

  /// Native builders for components.
  /// You should override [extendedBuilders] for detect own components.
  List<TBuilder<Component<dynamic>>> get nativeBuilders => [
        DescriptionComponent.new,
        GreetingComponent.new,
        IdComponent.new,
        ListComponent.new,
        NameComponent.new,
        NothingComponent.new,
        PictureComponent.new,
        StoryComponent.new,
        StringComponent.new,
        TiledmapRenderComponent.new,
      ];

  List<TBuilder<Component<dynamic>>> get extendedBuilders => [];

  /// Helper for generic detecting and processing a component.
  /// Swiss knife for [Component], [oxygen.Entity] and [Universe].
  /// You should override [extendedRunForComponent] for detect own components.
  R? runForComponent<R>(
    String componentUid, {
    required R Function<C extends Component<dynamic>, T>(
      TBuilder<C> builder, {
      Universe? u,
      oxygen.Entity? entity,
      T? value,
    }) run,
    Universe? u,
    oxygen.Entity? entity,
    JsonMap? jsonValue,
  }) {
    /* - Doesn't work.
    for (final b in allBuilders) {
      if (b().uid == componentUid) {
        return run(
          b,
          u: u,
          entity: entity,
          value: jsonValue == null ? null : b().jsonAsValue(jsonValue),
        );
      }
    }
    */

    final uid = componentUid;

    /// a number of components will be checked
    var count = 0;

    ++count;
    {
      const b = DescriptionComponent.new;
      if (b().uid == uid) {
        return run(
          b,
          u: u,
          entity: entity,
          value: jsonValue == null ? null : b().jsonAsValue(jsonValue),
        );
      }
    }

    ++count;
    {
      const b = GreetingComponent.new;
      if (b().uid == uid) {
        return run(
          b,
          u: u,
          entity: entity,
          value: jsonValue == null ? null : b().jsonAsValue(jsonValue),
        );
      }
    }

    ++count;
    {
      const b = IdComponent.new;
      if (b().uid == uid) {
        return run(
          b,
          u: u,
          entity: entity,
          value: jsonValue == null ? null : b().jsonAsValue(jsonValue),
        );
      }
    }

    ++count;
    {
      const b = ListComponent.new;
      if (b().uid == uid) {
        return run(
          b,
          u: u,
          entity: entity,
          value: jsonValue == null ? null : b().jsonAsValue(jsonValue),
        );
      }
    }

    ++count;
    {
      const b = NameComponent.new;
      if (b().uid == uid) {
        return run(
          b,
          u: u,
          entity: entity,
          value: jsonValue == null ? null : b().jsonAsValue(jsonValue),
        );
      }
    }

    ++count;
    {
      const b = NothingComponent.new;
      if (b().uid == uid) {
        return run(
          b,
          u: u,
          entity: entity,
          value: jsonValue == null ? null : b().jsonAsValue(jsonValue),
        );
      }
    }

    ++count;
    {
      const b = PictureComponent.new;
      if (b().uid == uid) {
        return run(
          b,
          u: u,
          entity: entity,
          value: jsonValue == null ? null : b().jsonAsValue(jsonValue),
        );
      }
    }

    ++count;
    {
      const b = StoryComponent.new;
      if (b().uid == uid) {
        return run(
          b,
          u: u,
          entity: entity,
          value: jsonValue == null ? null : b().jsonAsValue(jsonValue),
        );
      }
    }

    ++count;
    {
      const b = StringComponent.new;
      if (b().uid == uid) {
        return run(
          b,
          u: u,
          entity: entity,
          value: jsonValue == null ? null : b().jsonAsValue(jsonValue),
        );
      }
    }

    ++count;
    {
      const b = TiledmapRenderComponent.new;
      if (b().uid == uid) {
        return run(
          b,
          u: u,
          entity: entity,
          value: jsonValue == null ? null : b().jsonAsValue(jsonValue),
        );
      }
    }

    ae(count == nativeBuilders.length,
        'Inconsistent list of native components.');

    return extendedRunForComponent(
      componentUid,
      u: u,
      entity: entity,
      jsonValue: jsonValue,
      run: run,
    );
  }

  /// Will call after [runForComponent].
  R? extendedRunForComponent<R>(
    String componentUid, {
    required R Function<C extends Component<dynamic>, T>(
      TBuilder<C> builder, {
      Universe? u,
      oxygen.Entity? entity,
      T? value,
    }) run,
    Universe? u,
    oxygen.Entity? entity,
    JsonMap? jsonValue,
  }) =>
      null;
}
