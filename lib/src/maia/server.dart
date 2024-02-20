part of '../../../vast_world_maia.dart';

class NativeServer extends BaseServer {
  NativeServer()
      : super(
          name: _genNames.next.title,
          type: const ServerType(name: 'Vast World', symbol: '🌋'),
        ) {
    serverService = ServerService(this);
  }

  /// The state of [serverService] has a state of the server.
  /// But each service can contains an own state.
  ServerState get state => serverService.live.state;

  /// The options respects each session.
  ServerOptions options(String session) => state.ss.options[session]!;

  late final ServerService serverService;

  @override
  List<grpc.Service> get services => [serverService];

  static final _genNames = Names.volcanos();
}
