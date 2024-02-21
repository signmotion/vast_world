//
//  Generated code. Do not modify.
//  source: vw/hermes/client_state_enum.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use clientStateEnumBaseDescriptor instead')
const ClientStateEnumBase$json = {
  '1': 'ClientStateEnumBase',
  '2': [
    {'1': 'UNSPECIFIED_CLIENT_STATE', '2': 0},
    {'1': 'CLAIMING_SESSION_CLIENT_STATE', '2': 10},
    {'1': 'CLAIMED_SESSION_CLIENT_STATE', '2': 11},
    {'1': 'APPROVING_SESSION_CLIENT_STATE', '2': 20},
    {'1': 'APPROVED_SESSION_CLIENT_STATE', '2': 21},
    {'1': 'GETTING_ABOUT_SERVER_CLIENT_STATE', '2': 70},
    {'1': 'GOT_ABOUT_SERVER_CLIENT_STATE', '2': 71},
    {'1': 'OPENNING_SYNC_STREAMS_CLIENT_STATE', '2': 80},
    {'1': 'OPENED_SYNC_STREAMS_CLIENT_STATE', '2': 81},
    {'1': 'FETCHING_PLANS_CLIENT_STATE', '2': 90},
    {'1': 'FETCHED_PLANS_CLIENT_STATE', '2': 91},
    {'1': 'WAITING_INPUT_CLIENT_STATE', '2': 100},
    {'1': 'SENDING_ACT_CLIENT_STATE', '2': 200},
    {'1': 'SENT_ACT_SUCCESS_CLIENT_STATE', '2': 201},
    {'1': 'SENT_ACT_ERROR_CLIENT_STATE', '2': 202},
    {'1': 'PROCESSING_ACT_CLIENT_STATE', '2': 300},
    {'1': 'PROCESSED_ACT_SUCCESS_CLIENT_STATE', '2': 301},
    {'1': 'PROCESSED_ACT_ERROR_CLIENT_STATE', '2': 302},
  ],
};

/// Descriptor for `ClientStateEnumBase`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List clientStateEnumBaseDescriptor = $convert.base64Decode(
    'ChNDbGllbnRTdGF0ZUVudW1CYXNlEhwKGFVOU1BFQ0lGSUVEX0NMSUVOVF9TVEFURRAAEiEKHU'
    'NMQUlNSU5HX1NFU1NJT05fQ0xJRU5UX1NUQVRFEAoSIAocQ0xBSU1FRF9TRVNTSU9OX0NMSUVO'
    'VF9TVEFURRALEiIKHkFQUFJPVklOR19TRVNTSU9OX0NMSUVOVF9TVEFURRAUEiEKHUFQUFJPVk'
    'VEX1NFU1NJT05fQ0xJRU5UX1NUQVRFEBUSJQohR0VUVElOR19BQk9VVF9TRVJWRVJfQ0xJRU5U'
    'X1NUQVRFEEYSIQodR09UX0FCT1VUX1NFUlZFUl9DTElFTlRfU1RBVEUQRxImCiJPUEVOTklOR1'
    '9TWU5DX1NUUkVBTVNfQ0xJRU5UX1NUQVRFEFASJAogT1BFTkVEX1NZTkNfU1RSRUFNU19DTElF'
    'TlRfU1RBVEUQURIfChtGRVRDSElOR19QTEFOU19DTElFTlRfU1RBVEUQWhIeChpGRVRDSEVEX1'
    'BMQU5TX0NMSUVOVF9TVEFURRBbEh4KGldBSVRJTkdfSU5QVVRfQ0xJRU5UX1NUQVRFEGQSHQoY'
    'U0VORElOR19BQ1RfQ0xJRU5UX1NUQVRFEMgBEiIKHVNFTlRfQUNUX1NVQ0NFU1NfQ0xJRU5UX1'
    'NUQVRFEMkBEiAKG1NFTlRfQUNUX0VSUk9SX0NMSUVOVF9TVEFURRDKARIgChtQUk9DRVNTSU5H'
    'X0FDVF9DTElFTlRfU1RBVEUQrAISJwoiUFJPQ0VTU0VEX0FDVF9TVUNDRVNTX0NMSUVOVF9TVE'
    'FURRCtAhIlCiBQUk9DRVNTRURfQUNUX0VSUk9SX0NMSUVOVF9TVEFURRCuAg==');

