library;

import 'dart:math' as math;
import 'dart:typed_data';

import 'package:advance_math/advance_math.dart' as amath;
import 'package:astronomical_measurements/astronomical_measurements.dart';
import 'package:base_server/base_server.dart';
import 'package:collection/collection.dart';
import 'package:dart_helpers/dart_helpers.dart';
import 'package:dart_tiledmap/dart_tiledmap.dart';
import 'package:id_gen/id_gen.dart';
import 'package:id_gen/id_gen_helpers.dart';
import 'package:image/image.dart';
import 'package:json_dart/json_dart.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:oxygen/oxygen.dart' as oxygen;
import 'package:path/path.dart' as ph;
import 'package:protobuf/protobuf.dart';
import 'package:wfile/wfile.dart';
import 'package:xml/xml.dart';

import 'src/share/generated/protos/vw/share/act.pb.dart';
import 'src/share/generated/protos/vw/share/act_type_enum.pb.dart';
import 'src/share/generated/protos/vw/share/component.pb.dart';
import 'src/share/generated/protos/vw/share/error_explain_enum.pb.dart';
import 'src/share/generated/protos/vw/share/lore.pb.dart';
import 'src/share/generated/protos/vw/share/plan.pb.dart';
import 'src/share/generated/protos/vw/share/server_answer.pb.dart';

export 'src/share/generated/protos/vw/share/requests/prompt.pb.dart';
export 'src/share/generated/protos/vw/share/requests/prompt.pbenum.dart';
export 'src/share/generated/protos/vw/share/requests/prompt.pbjson.dart';

export 'src/share/generated/protos/vw/share/responses/image.pb.dart';
export 'src/share/generated/protos/vw/share/responses/image.pbenum.dart';
export 'src/share/generated/protos/vw/share/responses/image.pbjson.dart';

export 'src/share/generated/protos/vw/share/responses/json.pb.dart';
export 'src/share/generated/protos/vw/share/responses/json.pbenum.dart';
export 'src/share/generated/protos/vw/share/responses/json.pbjson.dart';

export 'src/share/generated/protos/vw/share/responses/text.pb.dart';
export 'src/share/generated/protos/vw/share/responses/text.pbenum.dart';
export 'src/share/generated/protos/vw/share/responses/text.pbjson.dart';

export 'src/share/generated/protos/vw/share/act_type_enum.pb.dart';
export 'src/share/generated/protos/vw/share/act_type_enum.pbenum.dart';
export 'src/share/generated/protos/vw/share/act_type_enum.pbjson.dart';

export 'src/share/generated/protos/vw/share/act.pb.dart';
export 'src/share/generated/protos/vw/share/act.pbenum.dart';
export 'src/share/generated/protos/vw/share/act.pbjson.dart';

export 'src/share/generated/protos/vw/share/component.pb.dart';
export 'src/share/generated/protos/vw/share/component.pbenum.dart';
export 'src/share/generated/protos/vw/share/component.pbjson.dart';

export 'src/share/generated/protos/vw/share/error_explain_enum.pb.dart';
export 'src/share/generated/protos/vw/share/error_explain_enum.pbenum.dart';
export 'src/share/generated/protos/vw/share/error_explain_enum.pbjson.dart';

export 'src/share/generated/protos/vw/share/lore.pb.dart';
export 'src/share/generated/protos/vw/share/lore.pbenum.dart';
export 'src/share/generated/protos/vw/share/lore.pbjson.dart';

export 'src/share/generated/protos/vw/share/plan.pb.dart';
export 'src/share/generated/protos/vw/share/plan.pbenum.dart';
export 'src/share/generated/protos/vw/share/plan.pbjson.dart';

export 'src/share/generated/protos/vw/share/server_answer_type_enum.pb.dart';
export 'src/share/generated/protos/vw/share/server_answer_type_enum.pbenum.dart';
export 'src/share/generated/protos/vw/share/server_answer_type_enum.pbjson.dart';

export 'src/share/generated/protos/vw/share/server_answer.pb.dart';
export 'src/share/generated/protos/vw/share/server_answer.pbenum.dart';
export 'src/share/generated/protos/vw/share/server_answer.pbjson.dart';

part 'src/share/acts/act_builder.dart';
part 'src/share/acts/act.dart';
part 'src/share/acts/add_plan_act.dart';
part 'src/share/acts/change_value.dart';
part 'src/share/acts/get_plan_act.dart';

part 'src/share/classes/bounding_box_2d.dart';
part 'src/share/classes/change_notifier.dart';
part 'src/share/classes/has_proto_base_mix.dart';
part 'src/share/classes/notifying_vector2.dart';
part 'src/share/classes/platform_dispatcher.dart';
part 'src/share/classes/transform_2d.dart';

part 'src/share/components/colors.dart';
part 'src/share/components/component_builder.dart';
part 'src/share/components/component.dart';
part 'src/share/components/description.dart';
part 'src/share/components/geometry_2d.dart';
part 'src/share/components/greeting.dart';
part 'src/share/components/id.dart';
part 'src/share/components/list.dart';
part 'src/share/components/name.dart';
part 'src/share/components/nothing.dart';
part 'src/share/components/picture.dart';
part 'src/share/components/plan.dart';
part 'src/share/components/render.dart';
part 'src/share/components/story.dart';
part 'src/share/components/string.dart';
part 'src/share/components/synopsis.dart';
part 'src/share/components/tiledmap_render.dart';
part 'src/share/components/title.dart';
part 'src/share/components/transform_2d.dart';
part 'src/share/components/unimplemented.dart';

part 'src/share/contents/content.dart';
part 'src/share/contents/cell_1d_content.dart';
part 'src/share/contents/cell_2d_content.dart';
part 'src/share/contents/empty_content.dart';

part 'src/share/errors/argument_error.dart';
part 'src/share/errors/error_explain_enum.dart';
part 'src/share/errors/error.dart';
part 'src/share/errors/lore.dart';
part 'src/share/errors/not_defined_device_error.dart';
part 'src/share/errors/not_found_error.dart';
part 'src/share/errors/plan_error.dart';
part 'src/share/errors/server_answer_error.dart';
part 'src/share/errors/session_error.dart';
part 'src/share/errors/unimplemented_component_error.dart';
part 'src/share/errors/value_session_error.dart';

part 'src/share/extensions/aabb.dart';
part 'src/share/extensions/convert_messages_ext.dart';
part 'src/share/extensions/offset.dart';
part 'src/share/extensions/rect.dart';
part 'src/share/extensions/vector2.dart';

part 'src/share/maps/tiled/v_converter.dart';
part 'src/share/maps/tiled/v_image.dart';
part 'src/share/maps/tiled/v_image_layer.dart';
part 'src/share/maps/tiled/v_map.dart';
part 'src/share/maps/tiled/v_object.dart';
part 'src/share/maps/tiled/v_objects_layer.dart';
part 'src/share/maps/tiled/v_parser.dart';
part 'src/share/maps/tiled/v_tileset.dart';

part 'src/share/imageries/DEPRECATED_imagery.dart';
part 'src/share/imageries/DEPRECATED_picture_imagery.dart';
part 'src/share/imageries/DEPRECATED_text_imagery.dart';

part 'src/share/keepers/DEPRECATED_keeper.dart';
part 'src/share/keepers/keeper.dart';
part 'src/share/keepers/DEPRECATED_tiledmap_keeper.dart';
part 'src/share/keepers/tiledmap_keeper.dart';

part 'src/share/influencers/lore.dart';
part 'src/share/influencers/influencer.dart';

part 'src/share/plans/absolute.dart';
part 'src/share/plans/DEPRECATED_plan2d.dart';
part 'src/share/plans/nothing.dart';
part 'src/share/plans/lore.dart';
part 'src/share/plans/lore_builder.dart';
part 'src/share/plans/plan_builder.dart';
part 'src/share/plans/plan.dart';
part 'src/share/plans/plan2d.dart';
part 'src/share/universe.dart';

part 'src/share/quant/axis_type.dart';
part 'src/share/quant/DEPRECATED_geometry_shape_2d_quant.dart';
part 'src/share/quant/DEPRECATED_has_geometry_2d_mix.dart';
part 'src/share/quant/DEPRECATED_has_shape_2d_mix.dart';
part 'src/share/quant/parent_child_calc_2d_mix.dart';
part 'src/share/quant/DEPRECATED_quant.dart';
part 'src/share/quant/quant.dart';

part 'src/share/renders/tiledmap/all_journeys.dart';
part 'src/share/renders/tiledmap/journey.dart';
part 'src/share/renders/tiledmap/place.dart';
part 'src/share/renders/tiledmap/tiledmap.dart';

part 'src/share/renders/count_exposed_image.dart';
part 'src/share/renders/image.dart';
part 'src/share/renders/nothing.dart';
part 'src/share/renders/one_picture_image.dart';
part 'src/share/renders/render.dart';
part 'src/share/renders/unimplemented.dart';
part 'src/share/renders/xml.dart';

part 'src/share/shapes/infinity_shape.dart';
part 'src/share/shapes/polygon_shape.dart';
part 'src/share/shapes/shape_2d.dart';
part 'src/share/shapes/shape.dart';

part 'src/share/utils/hid.dart';
part 'src/share/utils/id.dart';
part 'src/share/utils/log.dart';
part 'src/share/utils/random_fallback.dart';
part 'src/share/utils/u2d.dart';
part 'src/share/utils/uid.dart';

part 'src/share/a_state.dart';
part 'src/share/vs_config.dart';
