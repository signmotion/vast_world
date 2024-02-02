part of '../../../vast_world_hermes.dart';

class ClientBlocObserver extends BlocObserver {
  const ClientBlocObserver({this.showLogInfo = true});

  final bool showLogInfo;

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);

    if (showLogInfo) {
      logi('$event for $bloc');
    }
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);

    if (showLogInfo) {
      logi('$transition');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    loge('$error');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);

    if (showLogInfo) {
      logi('$bloc');
    }
  }
}
