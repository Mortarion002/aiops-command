import 'dart:convert';
import 'dart:io';

import 'package:aiops_command/data/repositories/mock/mock_activity_repository.dart';
import 'package:aiops_command/data/repositories/mock/mock_dashboard_repository.dart';
import 'package:aiops_command/data/repositories/mock/mock_insights_repository.dart';
import 'package:aiops_command/firebase_options.dart';
import 'package:aiops_command/features/auth/models/app_user.dart';
import 'package:aiops_command/features/dashboard/providers/date_range_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppUser', () {
    test('serializes to Firestore map and restores from map', () {
      const user = AppUser(
        id: 'user-1',
        email: 'ops@example.com',
        name: 'Ops User',
        age: 32,
      );

      final map = user.toMap();
      final restored = AppUser.fromMap(map, 'user-1');

      expect(map, {
        'id': 'user-1',
        'email': 'ops@example.com',
        'name': 'Ops User',
        'age': 32,
      });
      expect(restored.id, user.id);
      expect(restored.email, user.email);
      expect(restored.name, user.name);
      expect(restored.age, user.age);
    });

    test('copyWith keeps unchanged values', () {
      const user = AppUser(
        id: 'user-1',
        email: 'ops@example.com',
        name: 'Ops User',
        age: 32,
      );

      final updated = user.copyWith(age: 33);

      expect(updated.id, user.id);
      expect(updated.email, user.email);
      expect(updated.name, user.name);
      expect(updated.age, 33);
    });
  });

  group('Mock repositories', () {
    test('activity repository filters by level and service', () async {
      final repository = MockActivityRepository();

      final allLogs = await repository.getLogs('All');
      final errorLogs = await repository.getLogs('Error');
      final workerLogs = await repository.getLogs('Workers');

      expect(allLogs, hasLength(4));
      expect(errorLogs, hasLength(1));
      expect(errorLogs.single.level, 'ERROR');
      expect(workerLogs, hasLength(1));
      expect(workerLogs.single.service, 'Workers');
    });

    test(
      'dashboard repository returns different KPI snapshots by range',
      () async {
        final repository = MockDashboardRepository();

        final today = await repository.getKpi(DateRange.today);
        final allTime = await repository.getKpi(DateRange.allTime);
        final points = await repository.getRequestVolume(DateRange.last7Days);

        expect(today.requests, '4.2k');
        expect(allTime.requests, '1.2M');
        expect(points, hasLength(20));
        expect(points.first.x, 0);
      },
    );

    test('insights repository returns actionable recommendations', () async {
      final repository = MockInsightsRepository();

      final insights = await repository.getInsights();

      expect(insights, hasLength(3));
      expect(insights.first.title, contains('Latency'));
      expect(
        insights.every((item) => item.recommendedAction.isNotEmpty),
        isTrue,
      );
    });
  });

  group('Firebase configuration', () {
    test('Android Firebase options match google-services.json', () {
      final config =
          jsonDecode(
                File('android/app/google-services.json').readAsStringSync(),
              )
              as Map<String, dynamic>;
      final projectInfo = config['project_info'] as Map<String, dynamic>;
      final client =
          (config['client'] as List<dynamic>).single as Map<String, dynamic>;
      final clientInfo = client['client_info'] as Map<String, dynamic>;
      final apiKey =
          (client['api_key'] as List<dynamic>).single as Map<String, dynamic>;

      expect(
        DefaultFirebaseOptions.android.projectId,
        projectInfo['project_id'],
      );
      expect(
        DefaultFirebaseOptions.android.appId,
        clientInfo['mobilesdk_app_id'],
      );
      expect(DefaultFirebaseOptions.android.apiKey, apiKey['current_key']);
    });

    test('iOS Firebase bundle id matches Xcode project bundle id', () {
      final xcodeProject = File(
        'ios/Runner.xcodeproj/project.pbxproj',
      ).readAsStringSync();

      expect(
        xcodeProject,
        contains(
          'PRODUCT_BUNDLE_IDENTIFIER = ${DefaultFirebaseOptions.ios.iosBundleId};',
        ),
      );
    });
  });
}
