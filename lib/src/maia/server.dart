part of '../../../vast_world_maia.dart';

class Server extends BaseServer {
  Server()
      : super(
          name: Names.volcanos().next,
          type: const ServerType(name: 'Vast World', symbol: '🌋'),
        );

  @override
  List<ServerService> get services => [ServerService()];
}

final server = Server();
