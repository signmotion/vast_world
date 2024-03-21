part of '../../../vast_world_share.dart';

abstract class Error extends BaseEquatable implements Exception {
  /// TODO(sign): Can we get a stack trace from StackTrace.current from there?
  Error(this.code, this.message, this.stackTrace) {
    logger.e(props);
  }

  final ErrorExplainEnum code;
  final String message;
  final StackTrace stackTrace;

  /// Convert to string without shrinking.
  @override
  int get shrinkToString => 0;

  @override
  List<Object?> get props => [...super.props, code, message, stackTrace];

  @override
  String toString() =>
      '! Error: ${code.name} $message${message.endsWith('.') ? '' : '.'}'
      ' ${props.sublist(props.length).sjsonInLineWithoutWrappers}'
      '\nProvider: $runtimeType'
      '\nStack trace: $stackTrace';

  String get details => super.toString();
}
