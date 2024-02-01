part of '../../../vast_world_share.dart';

/// The base class for key-value brokers.
abstract class Broker<T> {
  const Broker();

  String get prefix;

  bool exists(String key);

  void clear();

  T? read(String key);

  void write(String key, T value);
}
