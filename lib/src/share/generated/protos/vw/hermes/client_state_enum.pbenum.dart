//
//  Generated code. Do not modify.
//  source: vw/hermes/client_state_enum.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Enum describing states of Client's App.
class ClientStateEnumBase extends $pb.ProtobufEnum {
  static const ClientStateEnumBase UNSPECIFIED_CLIENT_STATE = ClientStateEnumBase._(0, _omitEnumNames ? '' : 'UNSPECIFIED_CLIENT_STATE');
  static const ClientStateEnumBase CLAIMING_SESSION_CLIENT_STATE = ClientStateEnumBase._(10, _omitEnumNames ? '' : 'CLAIMING_SESSION_CLIENT_STATE');
  static const ClientStateEnumBase CLAIMED_SESSION_CLIENT_STATE = ClientStateEnumBase._(11, _omitEnumNames ? '' : 'CLAIMED_SESSION_CLIENT_STATE');
  static const ClientStateEnumBase APPROVING_SESSION_CLIENT_STATE = ClientStateEnumBase._(20, _omitEnumNames ? '' : 'APPROVING_SESSION_CLIENT_STATE');
  static const ClientStateEnumBase APPROVED_SESSION_CLIENT_STATE = ClientStateEnumBase._(21, _omitEnumNames ? '' : 'APPROVED_SESSION_CLIENT_STATE');
  static const ClientStateEnumBase GETTING_ABOUT_SERVER_CLIENT_STATE = ClientStateEnumBase._(70, _omitEnumNames ? '' : 'GETTING_ABOUT_SERVER_CLIENT_STATE');
  static const ClientStateEnumBase GOT_ABOUT_SERVER_CLIENT_STATE = ClientStateEnumBase._(71, _omitEnumNames ? '' : 'GOT_ABOUT_SERVER_CLIENT_STATE');
  static const ClientStateEnumBase OPENNING_SYNC_STREAMS_CLIENT_STATE = ClientStateEnumBase._(80, _omitEnumNames ? '' : 'OPENNING_SYNC_STREAMS_CLIENT_STATE');
  static const ClientStateEnumBase OPENED_SYNC_STREAMS_CLIENT_STATE = ClientStateEnumBase._(81, _omitEnumNames ? '' : 'OPENED_SYNC_STREAMS_CLIENT_STATE');
  static const ClientStateEnumBase FETCHING_CURRENT_PLAN_CLIENT_STATE = ClientStateEnumBase._(90, _omitEnumNames ? '' : 'FETCHING_CURRENT_PLAN_CLIENT_STATE');
  static const ClientStateEnumBase FETCHED_CURRENT_PLAN_CLIENT_STATE = ClientStateEnumBase._(91, _omitEnumNames ? '' : 'FETCHED_CURRENT_PLAN_CLIENT_STATE');
  static const ClientStateEnumBase FETCHING_PLANS_CLIENT_STATE = ClientStateEnumBase._(94, _omitEnumNames ? '' : 'FETCHING_PLANS_CLIENT_STATE');
  static const ClientStateEnumBase FETCHED_PLANS_CLIENT_STATE = ClientStateEnumBase._(95, _omitEnumNames ? '' : 'FETCHED_PLANS_CLIENT_STATE');
  static const ClientStateEnumBase WAITING_INPUT_CLIENT_STATE = ClientStateEnumBase._(100, _omitEnumNames ? '' : 'WAITING_INPUT_CLIENT_STATE');
  static const ClientStateEnumBase SENDING_ACT_CLIENT_STATE = ClientStateEnumBase._(200, _omitEnumNames ? '' : 'SENDING_ACT_CLIENT_STATE');
  static const ClientStateEnumBase SENT_ACT_SUCCESS_CLIENT_STATE = ClientStateEnumBase._(201, _omitEnumNames ? '' : 'SENT_ACT_SUCCESS_CLIENT_STATE');
  static const ClientStateEnumBase SENT_ACT_ERROR_CLIENT_STATE = ClientStateEnumBase._(202, _omitEnumNames ? '' : 'SENT_ACT_ERROR_CLIENT_STATE');
  static const ClientStateEnumBase PROCESSING_ACT_CLIENT_STATE = ClientStateEnumBase._(300, _omitEnumNames ? '' : 'PROCESSING_ACT_CLIENT_STATE');
  static const ClientStateEnumBase PROCESSED_ACT_SUCCESS_CLIENT_STATE = ClientStateEnumBase._(301, _omitEnumNames ? '' : 'PROCESSED_ACT_SUCCESS_CLIENT_STATE');
  static const ClientStateEnumBase PROCESSED_ACT_ERROR_CLIENT_STATE = ClientStateEnumBase._(302, _omitEnumNames ? '' : 'PROCESSED_ACT_ERROR_CLIENT_STATE');

  static const $core.List<ClientStateEnumBase> values = <ClientStateEnumBase> [
    UNSPECIFIED_CLIENT_STATE,
    CLAIMING_SESSION_CLIENT_STATE,
    CLAIMED_SESSION_CLIENT_STATE,
    APPROVING_SESSION_CLIENT_STATE,
    APPROVED_SESSION_CLIENT_STATE,
    GETTING_ABOUT_SERVER_CLIENT_STATE,
    GOT_ABOUT_SERVER_CLIENT_STATE,
    OPENNING_SYNC_STREAMS_CLIENT_STATE,
    OPENED_SYNC_STREAMS_CLIENT_STATE,
    FETCHING_CURRENT_PLAN_CLIENT_STATE,
    FETCHED_CURRENT_PLAN_CLIENT_STATE,
    FETCHING_PLANS_CLIENT_STATE,
    FETCHED_PLANS_CLIENT_STATE,
    WAITING_INPUT_CLIENT_STATE,
    SENDING_ACT_CLIENT_STATE,
    SENT_ACT_SUCCESS_CLIENT_STATE,
    SENT_ACT_ERROR_CLIENT_STATE,
    PROCESSING_ACT_CLIENT_STATE,
    PROCESSED_ACT_SUCCESS_CLIENT_STATE,
    PROCESSED_ACT_ERROR_CLIENT_STATE,
  ];

  static final $core.Map<$core.int, ClientStateEnumBase> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientStateEnumBase? valueOf($core.int value) => _byValue[value];

  const ClientStateEnumBase._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
