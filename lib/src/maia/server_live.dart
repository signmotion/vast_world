part of '../../../vast_world_maia.dart';

class ServerLive extends BaseLive<ServerState> {
  ServerLive(super.state);

  Future<String> claimAndApproveSession({
    required bool fixedSession,
    required String uidDevice,
    required ServerOptions options,
  }) async {
    final session = await claimSession(
      fixedSession: fixedSession,
      uidDevice: uidDevice,
      options: options,
    );
    await approveSession(session: session);

    return session;
  }

  Future<String> claimSession({
    required bool fixedSession,
    required String uidDevice,
    required ServerOptions options,
  }) async {
    final session = fixedSession ? fixedSessionUid : genSessionUid;
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
      v.options[session] = options;
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

  Lore loreFromState(String session) {
    final lore = state.lores[session];
    if (lore == null) {
      throw throw AbsentSessionLoreError(session, StackTrace.current);
    }

    return lore;
  }

  Plan<dynamic> planFromState(String session, String planId) {
    final plan = loreFromState(session).plans[planId];
    if (plan == null) {
      throw throw AbsentPlanError(session, StackTrace.current);
    }

    return plan;
  }

  Future<Iterable<String>> fetchPlanIds({
    required String session,
    bool checkSession = false,
  }) async {
    if (checkSession) {
      check(session, claimSession: true);
    }

    return loreFromState(session).plans.keys;
  }

  Future<PlanBase> fetchPlan({
    required String session,
    required String planId,
    bool checkSession = false,
  }) async {
    if (checkSession) {
      check(session, claimSession: true);
    }

    return planFromState(session, planId).base;
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
        return state.loreInfluencer.processingOnServer(lore, act);
      },
      ifAbsent: () => throw AbsentSessionLoreError(session, StackTrace.current),
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
    void checkSession(String session) => session.isSessionUid
        ? null
        : throw IllegalSessionUidError(session, StackTrace.current);

    checkSession(session);

    void checkClaimSession(String session) => state.isClaimedSession(session)
        ? null
        : throw NotClaimedSessionError(session, StackTrace.current);

    if (claimSession) {
      checkClaimSession(session);
    }

    void checkApproveSession(String session) => state.isApprovedSession(session)
        ? null
        : throw NotApprovedSessionError(session, StackTrace.current);

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
