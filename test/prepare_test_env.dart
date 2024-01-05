import 'dart:io' show Directory, Platform;

/// Call this method for all main tests.
void prepareTestEnv() {
  // For correct run a single test from IDE and
  // all tests from terminal by `dart test`.
  // \see https://github.com/flutter/flutter/issues/20907
  if (Directory.current.path.endsWith('${Platform.pathSeparator}test')) {
    Directory.current = Directory.current.parent;
  }
}
