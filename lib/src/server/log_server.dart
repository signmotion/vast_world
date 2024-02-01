part of '../../vast_world_server.dart';

void logiRequest(ServiceCall call, GeneratedMessage request) =>
    logi('🏹 ${call.prefix}'
        '\t${request.shortMapWithSignificantFieldsMessage.blured()}');

void logiResponse(ServiceCall call, GeneratedMessage response) =>
    logi('💘 ${call.prefix}'
        '\t${response.shortMapWithSignificantFieldsMessage.blured()}');

extension PrefixServiceCall on ServiceCall {
  String get prefix {
    String? method;
    if (ShareConfig.showMethodIntoLog) {
      method = clientMetadata?[':method'];
    }

    String? scheme;
    if (ShareConfig.showSchemeIntoLog) {
      scheme = clientMetadata?[':scheme'];
    }

    String? path;
    if (ShareConfig.showPathIntoLog) {
      path = clientMetadata?[':path'];
      if (ShareConfig.removePackagePathPrefixIntoLog) {
        path = path?.replaceAll(ShareConfig.packagePathPrefix, '');
      }
      if (ShareConfig.removePackagePathSuffixIntoLog) {
        path = path?.replaceFirst(ShareConfig.packagePathSuffix, '');
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
