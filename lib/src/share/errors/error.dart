part of '../../../vast_world_share.dart';

abstract class Error extends BaseEquatable implements Exception {
  const Error(this.code, this.message);

  final ErrorExplainEnum code;
  final String message;

  /// Convert to string without shrinking.
  @override
  int get shrinkToString => 0;

  @override
  List<Object?> get props => [code, message];

  @override
  String toString() =>
      '!) Error: ${code.name} $message${message.endsWith('.') ? '' : '.'}'
      ' ${props.sublist(props.length).sjsonInLineWithoutWrappers}'
      '\nProvider: $runtimeType';

  String get details => super.toString();
}
