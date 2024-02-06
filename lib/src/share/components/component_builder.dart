// ignore_for_file: inference_failure_on_function_invocation

part of '../../../vast_world_share.dart';

/// You should override [extendedFromBase], [extendedBuilders] and
/// [extendedRunForComponent] for construct own components.
class NativeComponentBuilder {
  const NativeComponentBuilder();

  C fromJson<C extends AnyComponent>(JsonMap json) =>
      fromBase(jsonAsComponentBase(json));

  /// See note for this class.
  C fromBase<C extends AnyComponent>(ComponentBase base) {
    logi('🧙‍♂️🟨 Constructing component based on'
            ' `${base.shortMapWithSignificantFieldsMessage}...'
        .bittenOfAllUuids32);

    late final AnyComponent component;
    try {
      component = _fromBase(base);
    } on UnimplementedError catch (_) {
      //component = extendedFromBase(base); - don't need this, covered by [builder]
    }

    logi('🧙‍♂️💚 Component `$component` constructed.');

    return component as C;
  }

  /// Will call after [fromBase].
  // C extendedFromBase<C extends AnyComponent>(ComponentBase base) =>
  //     throw UnimplementedError(base.hid);

  C _fromBase<C extends AnyComponent>(ComponentBase base) {
    final component = builder(base.uid)();
    final json = base.sjsonValue.jsonMap;
    component.init(component.jsonAsValue(json));

    return component as C;
  }

  TBuilder<AnyComponent> builder(String componentUid) => allBuilders.firstWhere(
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
        run: <C extends AnyComponent, T>(
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

  /// All components for the [entity].
  List<AnyComponent> components(
    Universe u,
    oxygen.Entity entity,
  ) {
    AnyComponent? run<C extends AnyComponent, T>(
      TBuilder<C> builder, {
      Universe? u,
      oxygen.Entity? entity,
      T? value,
    }) =>
        // looking at concrete component
        entity!.get<C>();

    final r = <AnyComponent>[];
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

  /// All builders of components for the [entity].
  List<TBuilder<AnyComponent>> componentsBuilders(
    Universe u,
    oxygen.Entity entity,
  ) {
    bool run<C extends AnyComponent, T>(
      TBuilder<C> builder, {
      Universe? u,
      oxygen.Entity? entity,
      T? value,
    }) =>
        // looking at concrete component is able
        entity!.has<C>();

    final r = <TBuilder<AnyComponent>>[];
    for (final componentBuilder in allBuilders) {
      final found = runForComponent(
        componentBuilder().uid,
        u: u,
        entity: entity,
        run: run,
      )!;
      if (found) {
        r.add(componentBuilder);
      }
    }

    return r;
  }

  List<TBuilder<AnyComponent>> get allBuilders =>
      [...nativeBuilders, ...extendedBuilders];

  /// Native builders for components.
  /// You should override [extendedBuilders] for detect own components.
  List<TBuilder<AnyComponent>> get nativeBuilders => [
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

  List<TBuilder<AnyComponent>> get extendedBuilders => [];

  /// Helper for generic detecting and processing a component.
  /// Swiss knife for [Component], [oxygen.Entity] and [Universe].
  /// You should override [extendedRunForComponent] for detect own components.
  R? runForComponent<R>(
    String componentUid, {
    required R Function<C extends AnyComponent, T>(
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
    required R Function<C extends AnyComponent, T>(
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
