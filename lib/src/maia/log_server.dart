part of '../../../vast_world_maia.dart';

void logiRequest(grpc.ServiceCall call, GeneratedMessage request) => logger.i(
    '🏹 ${call.prefix}'
    '\t${request.shortMapWithSignificantFieldsMessage.blured().sjsonInLine}');

void logiResponse(grpc.ServiceCall call, GeneratedMessage response) => logger.i(
    '💘 ${call.prefix}'
    '\t${response.shortMapWithSignificantFieldsMessage.blured().sjsonInLine}');

extension PrefixServiceCall on grpc.ServiceCall {
  String get prefix {
    String? method;
    if (ServerConfig.showMethodIntoLog) {
      method = clientMetadata?[':method'];
    }

    String? scheme;
    if (ServerConfig.showSchemeIntoLog) {
      scheme = clientMetadata?[':scheme'];
    }

    String? path;
    if (ServerConfig.showPathIntoLog) {
      path = clientMetadata?[':path'];
      if (ServerConfig.removePackagePathPrefixIntoLog) {
        path = path?.replaceAll(ServerConfig.packagePathPrefix, '');
      }
      if (ServerConfig.removePackagePathSuffixIntoLog) {
        path = path?.replaceFirst(ServerConfig.packagePathSuffix, '');
      }
    }

    var r = '';
    if (method != null) {
      r = method;
    }
    if (scheme != null) {
      r = '$r $scheme';
    }
    if (path != null) {
      final glue = scheme == null ? '' : '://';
      r = '$r$glue$path';
    }

    return r;
  }
}
