import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/repositories/interfaces/i_dashboard_repository.dart';
import '../../../data/repositories/mock/mock_dashboard_repository.dart';
import 'date_range_provider.dart';
import '../models/kpi_model.dart';
import '../models/health_item_model.dart';
import '../models/routing_lane_model.dart';
import '../models/chart_point_model.dart';
import '../models/activity_item_model.dart';

part 'dashboard_provider.g.dart';

@riverpod
IDashboardRepository dashboardRepository(Ref ref) => MockDashboardRepository();

@riverpod
Future<KpiSnapshot> kpiData(Ref ref) {
  final range = ref.watch(dateRangeProvider);
  return ref.watch(dashboardRepositoryProvider).getKpi(range);
}

@riverpod
Future<List<HealthItem>> systemHealthData(Ref ref) {
  return ref.watch(dashboardRepositoryProvider).getSystemHealth();
}

@riverpod
Future<List<RoutingLane>> routingLanesData(Ref ref) {
  return ref.watch(dashboardRepositoryProvider).getRoutingLanes();
}

@riverpod
Future<List<ChartPoint>> requestVolumeData(Ref ref) {
  final range = ref.watch(dateRangeProvider);
  return ref.watch(dashboardRepositoryProvider).getRequestVolume(range);
}

@riverpod
Future<List<RecentActivityItem>> recentActivityData(Ref ref) {
  return ref.watch(dashboardRepositoryProvider).getRecentActivity();
}
