library;

import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:advance_math/advance_math.dart' as amath;
import 'package:astronomical_measurements/astronomical_measurements.dart';
import 'package:collection/collection.dart';
import 'package:dart_helpers/dart_helpers.dart' hide JsonMap, JsonList;
import 'package:dart_tiledmap/dart_tiledmap.dart';
import 'package:id_gen/id_gen.dart';
import 'package:id_gen/id_gen_helpers.dart';
import 'package:image/image.dart';
import 'package:meta/meta.dart';
import 'package:oxygen/oxygen.dart' as oxygen;
import 'package:path/path.dart' as ph;
import 'package:protobuf/protobuf.dart';
import 'package:wfile/wfile.dart' hide StringJsonExt;
import 'package:xml/xml.dart';

import 'vast_world_protos.dart';

part 'src/acts/act_builder.dart';
part 'src/acts/act.dart';
part 'src/acts/change_value.dart';

part 'src/brokers/filesystem/filesystem.dart';
part 'src/brokers/filesystem/image.dart';
part 'src/brokers/filesystem/text.dart';
part 'src/brokers/filesystem/xml.dart';

part 'src/brokers/broker.dart';

part 'src/classes/bounding_box_2d.dart';
part 'src/classes/change_notifier.dart';
part 'src/plans/lore.dart';
part 'src/classes/notifying_vector2.dart';
part 'src/classes/platform_dispatcher.dart';
part 'src/classes/transform_2d.dart';

part 'src/extensions/aabb.dart';
part 'src/extensions/convert_messages_ext.dart';
part 'src/extensions/offset.dart';
part 'src/extensions/rect.dart';
part 'src/extensions/vector2.dart';

part 'src/contents/content.dart';
part 'src/contents/cell_1d_content.dart';
part 'src/contents/cell_2d_content.dart';
part 'src/contents/empty_content.dart';

part 'src/maps/tiled/v_converter.dart';
part 'src/maps/tiled/v_image.dart';
part 'src/maps/tiled/v_image_layer.dart';
part 'src/maps/tiled/v_map.dart';
part 'src/maps/tiled/v_object.dart';
part 'src/maps/tiled/v_objects_layer.dart';
part 'src/maps/tiled/v_parser.dart';
part 'src/maps/tiled/v_tileset.dart';

part 'src/imageries/DEPRECATED_imagery.dart';
part 'src/imageries/DEPRECATED_picture_imagery.dart';
part 'src/imageries/DEPRECATED_text_imagery.dart';

part 'src/keepers/DEPRECATED_keeper.dart';
part 'src/keepers/keeper.dart';
part 'src/keepers/DEPRECATED_tiledmap_keeper.dart';
part 'src/keepers/tiledmap_keeper.dart';

part 'src/plans/influencers/lore.dart';
part 'src/plans/influencers/influencer.dart';

part 'src/plans/components/component_builder.dart';
part 'src/plans/components/description.dart';
part 'src/plans/components/geometry_2d.dart';
part 'src/plans/components/greeting.dart';
part 'src/plans/components/id.dart';
part 'src/plans/components/list.dart';
part 'src/plans/components/name.dart';
part 'src/plans/components/nothing.dart';
part 'src/plans/components/picture.dart';
part 'src/plans/components/plan.dart';
part 'src/plans/components/render.dart';
part 'src/plans/components/story.dart';
part 'src/plans/components/string.dart';
part 'src/plans/components/tiledmap_render.dart';
part 'src/plans/components/transform_2d.dart';
part 'src/plans/components/component.dart';
part 'src/plans/components/xml_render.dart';

part 'src/plans/absolute.dart';
part 'src/plans/all_journeys.dart';
part 'src/plans/DEPRECATED_plan2d.dart';
part 'src/plans/nothing.dart';
part 'src/plans/journey.dart';
part 'src/plans/place.dart';
part 'src/plans/plan.dart';
part 'src/plans/plan2d.dart';
part 'src/plans/universe.dart';

part 'src/quant/axis_type.dart';
part 'src/quant/DEPRECATED_geometry_shape_2d_quant.dart';
part 'src/quant/DEPRECATED_has_geometry_2d_mix.dart';
part 'src/quant/DEPRECATED_has_shape_2d_mix.dart';
part 'src/quant/parent_child_calc_2d_mix.dart';
part 'src/quant/DEPRECATED_quant.dart';
part 'src/quant/quant.dart';

part 'src/renders/tiledmap/all_journeys.dart';
part 'src/renders/tiledmap/journey.dart';
part 'src/renders/tiledmap/place.dart';
part 'src/renders/tiledmap/tiledmap.dart';

part 'src/renders/count_exposed_image.dart';
part 'src/renders/image.dart';
part 'src/renders/nothing.dart';
part 'src/renders/one_picture_image.dart';
part 'src/renders/render.dart';
part 'src/renders/xml.dart';

part 'src/shapes/infinity_shape.dart';
part 'src/shapes/polygon_shape.dart';
part 'src/shapes/shape_2d.dart';
part 'src/shapes/shape.dart';

part 'src/utils/random_fallback.dart';
part 'src/utils/u2d.dart';

part 'src/vs_config.dart';
