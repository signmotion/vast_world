part of '../../../vast_world_share.dart';

abstract class Error extends BaseEquatable implements Exception {
  const Error(this.message);

  final String message;

  /// Convert to string without shrinking.
  @override
  int get shrinkToString => 0;

  @override
  List<Object?> get props => [message];

  @override
  String toString() => '!) Error: $message${message.endsWith('.') ? '' : '.'}'
      ' ${props.sublist(1).sjsonInLineWithoutWrappers}'
      '\nProvider: $runtimeType';

  String get details => super.toString();
}
