// ignore_for_file: inference_failure_on_function_invocation

part of '../../../vast_world.dart';

class ComponentBuilder {
  const ComponentBuilder();

  T fromJson<T extends Component<dynamic>>(JsonMap json) =>
      fromBase(jsonAsComponentBase(json));

  T fromBase<T extends Component<dynamic>>(ComponentBase base) {
    logi('🧙‍♂️🟨 Constructing component based on '
        '`${base.shortMapWithSignificantFieldsMessage}...');

    final component = builder(base.uid)();
    final json = base.sjsonValue.jsonMap;
    component.init(component.jsonAsValue(json));

    logi('🧙‍♂️💚 Component `$component` constructed.');

    return component as T;
  }

  TBuilder<Component<dynamic>> builder(String componentUid) {
    if (componentUid == DescriptionComponent().uid) {
      return DescriptionComponent.new;
    }

    if (componentUid == GreetingComponent().uid) {
      return GreetingComponent.new;
    }

    if (componentUid == IdComponent().uid) {
      return IdComponent.new;
    }

    if (componentUid == NameComponent().uid) {
      return NameComponent.new;
    }

    // TODO

    throw UnimplementedError(componentUid);
  }

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
        }) {
          u!.registerComponent(builder);
          entity!.add<C, dynamic>(
            builder().jsonAsValue(jsonValue) as T,
          );
        },
      );

  R runForComponent<R>(
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
    final json = jsonValue!;

    if (DescriptionComponent().uid == componentUid) {
      return run(
        DescriptionComponent.new,
        u: u,
        entity: entity,
        value: DescriptionComponent().jsonAsValue(json),
      );
    }

    if (GreetingComponent().uid == componentUid) {
      return run(
        GreetingComponent.new,
        u: u,
        entity: entity,
        value: GreetingComponent().jsonAsValue(json),
      );
    }

    if (IdComponent().uid == componentUid) {
      return run(
        IdComponent.new,
        u: u,
        entity: entity,
        value: IdComponent().jsonAsValue(json),
      );
    }

    if (NameComponent().uid == componentUid) {
      return run(
        NameComponent.new,
        u: u,
        entity: entity,
        value: NameComponent().jsonAsValue(json),
      );
    }

    // TODO

    throw UnimplementedError(componentUid);
  }

  // ) {

  //   runForComponent
  //   //const cb = ComponentBuilder();
  //   //final builder = cb.builder(componentUid);
  //   //u.registerComponent(builder);

  //   if (DescriptionComponent().uid == componentUid) {
  //     return DescriptionComponent.new;
  //   }

  //   if (GreetingComponent().uid == componentUid) {
  //     return GreetingComponent.new;
  //   }

  //   if (IdComponent().uid == componentUid) {
  //     return IdComponent.new;
  //   }

  //   if (NameComponent().uid == componentUid) {
  //     u.registerComponent(NameComponent.new);
  //     entity.add<NameComponent, String>(NameComponent().jsonAsValue(json));
  //     return;
  //   }

  //   // TODO

  //   throw UnimplementedError(componentUid);
  // }
}
