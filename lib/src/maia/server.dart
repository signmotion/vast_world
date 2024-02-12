part of '../../../vast_world_maia.dart';

class NativeServer extends BaseServer {
  NativeServer()
      : super(
          name: _genNames.next.title,
          type: const ServerType(name: 'Vast World', symbol: '🌋'),
        );

  @override
  List<grpc.Service> get services => [ServerService(this)];

  static final _genNames = Names.volcanos();
}
