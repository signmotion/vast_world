part of '../../../vast_world_server.dart';

class NotFoundError<T> extends SessionError {
  const NotFoundError(String session, this.value, this.name)
      : super(
          'Not found $name by `$value`.',
          session: session,
        );

  final T value;

  /// Name of value for show in the [toString].
  final String name;

  @override
  List<Object?> get props => [...super.props, value, name];
}
