import 'package:test/test.dart';
import 'package:vast_world/vast_world.dart';

import '../prepare_test_env.dart';

void main() async {
  prepareTestEnv();

  final ma = constructServerLive();

  Future<String> claimSession() async => ma.claimSession(
        fixedSession: false,
        uidDevice: 'device-a',
        options: ServerOptions(),
      );

  group('session', () {
    test('claim the session', () async {
      final session = await claimSession();
      expect(session, isNotEmpty);
      expect(ma.state.ss.claimedSessionsDevices.keys, containsOnce(session));
      expect(ma.state.ss.approvedSessions, isEmpty);
    });

    test('claim same session for client with same UID device', () async {
      final a = await claimSession();
      final b = await claimSession();
      expect(a, isNot(equals(b)));
    });

    test('claim unique sessions for client with different UIDs device',
        () async {
      final a = await ma.claimSession(
        fixedSession: false,
        uidDevice: 'device-a',
        options: ServerOptions(),
      );
      final b = await ma.claimSession(
        fixedSession: false,
        uidDevice: 'device-b',
        options: ServerOptions(),
      );
      expect(a, isNot(equals(b)));
    });

    test('approve the session', () async {
      final session = await ma.claimSession(
        fixedSession: false,
        uidDevice: 'device-a',
        options: ServerOptions(),
      );
      await ma.approveSession(session: session);
      final ss = ma.state.ss;
      expect(ss.claimedSessionsDevices.keys, containsOnce(session));
      expect(ss.approvedSessions.keys, containsOnce(session));
    });

    test('error then the session UID is empty', () async {
      const session = '';
      expectLater(
        ma.approveSession(session: session),
        throwsA(isA<IllegalSessionUidError>()),
      );
    });

    test('error then the session UID is illegal', () async {
      // should be [genSessionUid]
      final session = genActUid;
      expectLater(
        ma.approveSession(session: session),
        throwsA(isA<IllegalSessionUidError>()),
      );
    });

    test('error then the session is not claimed but request approved',
        () async {
      final session = genSessionUid;
      expectLater(
        ma.approveSession(session: session),
        throwsA(isA<NotClaimedSessionError>()),
      );
    });
  });
}
