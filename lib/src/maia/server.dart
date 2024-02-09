part of '../../../vast_world_maia.dart';

class NativeServer extends BaseServer {
  NativeServer()
      : super(
          name: Names.volcanos().next,
          type: const ServerType(name: 'Vast World', symbol: '🌋'),
        );

  @override
  List<ServerService> get services => [ServerService(this)];
}
