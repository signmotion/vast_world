part of '../../../vast_world_share.dart';

class NotDefinedDeviceError extends Error {
  const NotDefinedDeviceError([String? session])
      : super(
          ErrorExplainEnum.NOT_DEFINED_DEVICE_ERROR_EXPLAIN,
          'Uid device of Client is not defined.'
          '${session == null ? "" : " Session: `$session`."}',
        );
}
