part of '../../../vast_world_maia.dart';

class ServerLive extends BaseLive<ServerState> {
  ServerLive(super.state);

  Future<String> claimAndApproveSession({required String uidDevice}) async {
    final session = await claimSession(uidDevice: uidDevice);
    await approveSession(session: session);

    return session;
  }

  Future<String> claimSession({required String uidDevice}) async {
    final session = genSessionUid;
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
      v.options = ServerOptionsBase();
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
    bool checkSession = false,
  }) async {
    if (checkSession) {
      check(session, claimSession: true);
    }

    if (state.lores[session] == null) {
      logw('Session `$session` not found. New Lore created.');
      emit(
        state.copyWith(lores: {
          session: Lore(componentBuilder: state.componentBuilder),
        }),
      );
    }

    state.lores.update(
      session,
      (lore) {
        final act = NativeActBuilder(state.componentBuilder).fromBase(actBase);
        return state.loreInfluencer.processing(lore, act);
      },
      ifAbsent: () =>
          throw ArgumentError('Lore for session `$session` not found.'),
    );
    emit(state.copyWith(lores: state.lores));

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
        session.isSessionUid ? null : throw IllegalUidSessionError(session);

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

ServerLive constructServerLive() {
  final universe = Universe();

  final state = ServerState(
    ss: ServerStateBase(),
    u: universe,
    planBuilder: NativePlanBuilder.new,
    componentBuilder: NativeComponentBuilder.new,
    lores: const {},
    loreInfluencer: LoreInfluencer(
      u: universe,
      planBuilder: NativePlanBuilder.new,
      componentBuilder: NativeComponentBuilder.new,
    ),
  );

  return ServerLive(state);
}
