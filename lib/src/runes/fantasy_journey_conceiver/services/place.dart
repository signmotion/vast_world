part of '../../../../runes/fantasy_journey_conceiver.dart';

class PlaceService extends PlaceServiceBase with ServiceMix {
  @override
  String get name => 'Place - Fantasy Country Conceiver';

  @override
  Future<maia.ImageResponse> conceivingImagePlace(
      grpc.ServiceCall call, maia.PromptRequest request) {
    // TODO: implement conceivingImagePlace
    throw UnimplementedError();
  }

  @override
  Future<ConceivingNameAndIdPlaceResponse> conceivingNameAndIdPlace(
      grpc.ServiceCall call, maia.PromptRequest request) {
    // TODO: implement conceivingNameAndIdPlace
    throw UnimplementedError();
  }
}
