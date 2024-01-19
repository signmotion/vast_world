// ignore_for_file: inference_failure_on_function_invocation

part of '../../vast_world.dart';

/// Contains all journeys.
class AllJourneysPlan extends Plan<JourneyPlan> {
  AllJourneysPlan(
    super.u, {
    super.hid = '',
    super.uid = '',
  }) : super(imageRenderForExposed: countExposedImageRender);
}
