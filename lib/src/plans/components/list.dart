part of '../../../vast_world.dart';

class ListComponent<C extends VComponent<dynamic>> extends VComponent<List<C>> {
  @override
  List<C> get empty => <C>[];
}
