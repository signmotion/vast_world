part of '../../../vast_world_server.dart';

class Live extends BaseLive<State> {
  Live(super.state) : loreInfluencer = const LoreInfluencer();

  final LoreInfluencer loreInfluencer;

  Future<String> claimAndApproveSession({required String uidDevice}) async {
    final session = await claimSession(uidDevice: uidDevice);
    await approveSession(session: session);

    return session;
  }

  Future<String> claimSession({required String uidDevice}) async {
    final session = genUuid;
    check(session);

    state.ss.freeze();
    final ns = state.ss.rebuild((v) {
      // claim the session
      if (state.isClaimedSession(session)) {
        logw('There is already a session `$session`'
            ' in claimedSessionsDevices.'
            ' Rewrote it for client device `$uidDevice`.');
      }
      v.claimedSessionsDevices[session] = uidDevice;
      v.options = OptionsBase();
    });
    emit(state.copyWith(ss: ns));

    return session;
  }

  Future<bool> approveSession({required String session}) async {
    check(session, claimSession: true);

    state.ss.freeze();
    final ns = state.ss.rebuild((v) {
      // approve the session
      v.approvedSessions[session] = true;
    });
    emit(state.copyWith(ss: ns));

    return true;
  }

  Future<bool> processingActOnLoreSession({
    required String session,
    required ActBase actBase,
  }) async {
    check(session, claimSession: true);

    //final act = const ActBuilder().fromBase(actBase);

    state.ss.freeze();
    final ns = state.ss.rebuild((v) {
      final lore = v.lores[session];
      ae(lore != null, 'Lore for session `$session` not found.');

      // TODO v.lores[session] = loreInfluencer.processing(lore!, act);
      throw UnimplementedError();
    });
    emit(state.copyWith(ss: ns));

    return true;
  }

  /// [permitWorkshop] Checks a workshop with session correct, claimed and approoved.
  void check(
    String session, {
    bool claimSession = false,
    bool approveSession = false,
    bool permitSession = false,
  }) {
    void checkSession(String session) =>
        session.isUuid ? null : throw SessionUidIllegalError(session);

    checkSession(session);

    void checkClaimSession(String session) => state.isClaimedSession(session)
        ? null
        : throw NotClaimedSessionError(session);

    if (claimSession) {
      checkClaimSession(session);
    }

    void checkApproveSession(String session) => state.isApprovedSession(session)
        ? null
        : throw NotApprovedSessionError(session);

    if (approveSession) {
      checkApproveSession(session);
    }

    void checkPermitSession(String session) {
      checkSession(session);
      checkClaimSession(session);
      checkApproveSession(session);
    }

    if (permitSession) {
      checkPermitSession(session);
    }
  }
}

final live = Live(State(ss: ServerStateBase()));
