import '../interfaces/i_dashboard_repository.dart';
import '../../../features/dashboard/models/kpi_model.dart';
import '../../../features/dashboard/models/health_item_model.dart';
import '../../../features/dashboard/models/routing_lane_model.dart';
import '../../../features/dashboard/models/chart_point_model.dart';
import '../../../features/dashboard/models/activity_item_model.dart';
import '../../../features/dashboard/providers/date_range_provider.dart';
import '../../../shared/widgets/pill_badge.dart';

class MockDashboardRepository implements IDashboardRepository {
  @override
  Future<KpiSnapshot> getKpi(DateRange range) async {
    await Future.delayed(const Duration(milliseconds: 600)); // Simulate network
    switch (range) {
      case DateRange.today:
        return KpiSnapshot(
          requests: '4.2k', requestsBadge: '+12%', requestsBadgeType: BadgeType.success,
          latency: '24ms', latencyBadge: '-5%', latencyBadgeType: BadgeType.success,
          errorRate: '0.01%', errorBadge: 'FLAT', errorBadgeType: BadgeType.neutral,
          activeNodes: '340', nodesBadge: '+2', nodesBadgeType: BadgeType.info,
        );
      case DateRange.last7Days:
        return KpiSnapshot(
          requests: '124.5k', requestsBadge: '+12%', requestsBadgeType: BadgeType.success,
          latency: '42ms', latencyBadge: '-5%', latencyBadgeType: BadgeType.success,
          errorRate: '0.01%', errorBadge: 'FLAT', errorBadgeType: BadgeType.neutral,
          activeNodes: '340', nodesBadge: '+2', nodesBadgeType: BadgeType.info,
        );
      case DateRange.last30Days:
        return KpiSnapshot(
          requests: '480k', requestsBadge: '+8%', requestsBadgeType: BadgeType.success,
          latency: '38ms', latencyBadge: '-3%', latencyBadgeType: BadgeType.success,
          errorRate: '0.02%', errorBadge: '+0.01%', errorBadgeType: BadgeType.warning,
          activeNodes: '335', nodesBadge: '-5', nodesBadgeType: BadgeType.error,
        );
      case DateRange.allTime:
        return KpiSnapshot(
          requests: '1.2M', requestsBadge: '+22%', requestsBadgeType: BadgeType.success,
          latency: '44ms', latencyBadge: '+2%', latencyBadgeType: BadgeType.warning,
          errorRate: '0.03%', errorBadge: '+0.02%', errorBadgeType: BadgeType.error,
          activeNodes: '298', nodesBadge: '-42', nodesBadgeType: BadgeType.error,
        );
    }
  }

  @override
  Future<List<HealthItem>> getSystemHealth() async {
    return [
      HealthItem(name: 'Gateway', status: '99.99%', percentage: 0.9999),
      HealthItem(name: 'Vector DB', status: '99.95%', percentage: 0.9995),
      HealthItem(name: 'Workers', status: '100%', percentage: 1.0),
      HealthItem(name: 'Budget', status: 'On Track'),
    ];
  }

  @override
  Future<List<RoutingLane>> getRoutingLanes() async {
    return [
      RoutingLane(region: 'us-east-1', requests: '45.2K', isHealthy: true),
      RoutingLane(region: 'eu-west-1', requests: '32.8K', isHealthy: true),
      RoutingLane(region: 'ap-northeast-2', requests: '12.1K', isHealthy: false),
    ];
  }

  @override
  Future<List<ChartPoint>> getRequestVolume(DateRange range) async {
    return List.generate(20, (index) => ChartPoint(index.toDouble(), (100 + index * 5 + (index % 3) * 20).toDouble()));
  }

  @override
  Future<List<RecentActivityItem>> getRecentActivity() async {
    return [
      RecentActivityItem(message: 'Model weights updated for semantic routing', timeAgo: '2 MINS AGO', source: 'SYSTEM', isHighlight: true),
      RecentActivityItem(message: 'Auto-scaling triggered in eu-west-1', timeAgo: '15 MINS AGO', source: 'ORCHESTRATOR', isHighlight: false),
      RecentActivityItem(message: 'Daily budget threshold alert cleared', timeAgo: '1 HOUR AGO', source: 'BILLING', isHighlight: false),
    ];
  }
}
