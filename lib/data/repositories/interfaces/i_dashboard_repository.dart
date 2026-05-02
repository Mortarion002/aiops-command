import '../../../features/dashboard/models/kpi_model.dart';
import '../../../features/dashboard/models/health_item_model.dart';
import '../../../features/dashboard/models/routing_lane_model.dart';
import '../../../features/dashboard/models/chart_point_model.dart';
import '../../../features/dashboard/models/activity_item_model.dart';
import '../../../features/dashboard/providers/date_range_provider.dart';

abstract class IDashboardRepository {
  Future<KpiSnapshot> getKpi(DateRange range);
  Future<List<HealthItem>> getSystemHealth();
  Future<List<RoutingLane>> getRoutingLanes();
  Future<List<ChartPoint>> getRequestVolume(DateRange range);
  Future<List<RecentActivityItem>> getRecentActivity();
}
