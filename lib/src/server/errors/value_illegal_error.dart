part of '../../../vast_world_server.dart';

class ValueIllegalError<T> extends SessionError {
  const ValueIllegalError(String session, this.value, this.name)
      : super(
          value is String && value.length == 0
              ? 'Empty $name.'
              : 'Illegal $name: `$value`.',
          session: session,
        );

  final T value;

  /// Name of value for show in the [toString].
  final String name;

  @override
  List<Object?> get props => [...super.props, value, name];
}

class SessionUidIllegalError extends ValueIllegalError<String> {
  const SessionUidIllegalError(String session)
      : super(session, session, 'session UID');
}
