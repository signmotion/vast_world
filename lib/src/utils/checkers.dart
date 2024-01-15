part of '../../vast_world.dart';

/// Assert with ArgumentError: message and argument name.
void ae(bool condition, String message) {
  if (!condition) {
    throw ArgumentError(message);
  }
}

/// Assert with ArgumentError: argument name.
void arge(bool condition, dynamic value, String name) {
  if (!condition) {
    throw ArgumentError.value(value, name);
  }
}
