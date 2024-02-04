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
import 'package:meta/meta.dart';
import 'package:oxygen/oxygen.dart' as oxygen;
import 'package:path/path.dart' as ph;
import 'package:wfile/wfile.dart';
import 'package:xml/xml.dart';

import 'vast_world_protos.dart';

part 'src/share/acts/act_builder.dart';
part 'src/share/acts/act.dart';
part 'src/share/acts/add_plan_act.dart';
part 'src/share/acts/change_value.dart';

part 'src/share/classes/bounding_box_2d.dart';
part 'src/share/classes/change_notifier.dart';
part 'src/share/classes/has_proto_base_mix.dart';
part 'src/share/classes/notifying_vector2.dart';
part 'src/share/classes/platform_dispatcher.dart';
part 'src/share/classes/transform_2d.dart';

part 'src/share/errors/error.dart';
part 'src/share/errors/plan_error.dart';

part 'src/share/extensions/aabb.dart';
part 'src/share/extensions/convert_messages_ext.dart';
part 'src/share/extensions/offset.dart';
part 'src/share/extensions/rect.dart';
part 'src/share/extensions/vector2.dart';

part 'src/share/contents/content.dart';
part 'src/share/contents/cell_1d_content.dart';
part 'src/share/contents/cell_2d_content.dart';
part 'src/share/contents/empty_content.dart';

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

part 'src/share/components/component_builder.dart';
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
part 'src/share/components/tiledmap_render.dart';
part 'src/share/components/transform_2d.dart';
part 'src/share/components/component.dart';

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
part 'src/share/renders/xml.dart';

part 'src/share/shapes/infinity_shape.dart';
part 'src/share/shapes/polygon_shape.dart';
part 'src/share/shapes/shape_2d.dart';
part 'src/share/shapes/shape.dart';

part 'src/share/utils/random_fallback.dart';
part 'src/share/utils/u2d.dart';
part 'src/share/utils/uid.dart';

part 'src/share/a_state.dart';
part 'src/share/universe_filler.dart';
part 'src/share/vs_config.dart';
