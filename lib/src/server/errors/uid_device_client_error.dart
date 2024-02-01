part of '../../../vast_world_server.dart';

class NotDefinedUidDeviceClientError extends SessionError {
  const NotDefinedUidDeviceClientError(String session)
      : super('Uid device of Client is not defined.', session: session);
}
