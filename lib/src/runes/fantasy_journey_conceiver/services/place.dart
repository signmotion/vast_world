part of '../../../../runes/fantasy_journey_conceiver.dart';

class PlaceService extends PlaceServiceBase with ServiceMix {
  @override
  String get name => 'Place - Fantasy Country Conceiver';

  @override
  Future<maia.ImageResponse> conceiveImage(
    grpc.ServiceCall call,
    maia.PromptRequest request,
  ) {
    // TODO: implement conceiveImagePlace
    throw UnimplementedError();
  }

  @override
  Future<ConceiveNameAndIdPlaceResponse> conceiveNameAndId(
    grpc.ServiceCall call,
    maia.PromptRequest request,
  ) {
    // TODO: implement conceiveNameAndId
    throw UnimplementedError();
  }
}
