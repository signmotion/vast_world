import 'package:test/test.dart';
import 'package:vast_world/vast_world.dart';

import '../prepare_test_env.dart';

void main() async {
  prepareTestEnv();

  final ma = live;

  Future<String> claimSession() async => ma.claimSession(uidDevice: 'device-a');

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
        uidDevice: 'device-a',
      );
      final b = await ma.claimSession(
        uidDevice: 'device-b',
      );
      expect(a, isNot(equals(b)));
    });

    test('approve the session', () async {
      final session = await ma.claimSession(uidDevice: 'device-a');
      await ma.approveSession(session: session);
      final ss = ma.state.ss;
      expect(ss.claimedSessionsDevices.keys, containsOnce(session));
      expect(ss.approvedSessions.keys, containsOnce(session));
    });

    test('error then the session UID is empty', () async {
      const session = '';
      expectLater(
        ma.approveSession(session: session),
        throwsA(isA<SessionUidIllegalError>()),
      );
    });

    test('error then the session UID is illegal', () async {
      // should be [genSessionUid]
      final session = genActUid;
      expectLater(
        ma.approveSession(session: session),
        throwsA(isA<SessionUidIllegalError>()),
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
