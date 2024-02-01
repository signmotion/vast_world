part of '../../../vast_world_maia.dart';

class Server extends BaseServer<Server> {
  Server()
      : super(
          name: Names.volcanos().next,
          type: const ServerType(name: 'Vast World', symbol: '🌋'),
        );

  @override
  List<Service> get services => [Service()];
}

final server = Server();
