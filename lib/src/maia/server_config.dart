part of '../../../vast_world_maia.dart';

class ServerConfig {
  static InternetAddress get serverHost => InternetAddress.anyIPv4;
  static int get serverPort =>
      int.parse(Platform.environment['PORT'] ?? '8080');

  // server log
  static const showMethodIntoLog = false;
  static const showSchemeIntoLog = false;
  static const showPathIntoLog = true;
  static const packagePathPrefix = '/ab.aides.';
  static const removePackagePathPrefixIntoLog = true;
  static const packagePathSuffix = '.Service';
  static const removePackagePathSuffixIntoLog = true;
}
