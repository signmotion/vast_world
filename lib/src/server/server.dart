part of '../../vast_world_server.dart';

class Server extends BaseServer<Server> {
  Server() : super(name: C.names.next, type: C.type);

  @override
  List<Service> get services => [Service()];
}

final server = Server();
