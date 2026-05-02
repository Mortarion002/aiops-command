import '../interfaces/i_insights_repository.dart';
import '../../../features/insights/models/insight_item_model.dart';
import '../../../shared/widgets/pill_badge.dart';

class MockInsightsRepository implements IInsightsRepository {
  @override
  Future<List<InsightItem>> getInsights() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      InsightItem(
        title: "High Latency in Vector DB Search",
        description: "Queries to the semantic index are taking 40% longer than the 7-day average.",
        severity: "HIGH",
        severityBadgeType: BadgeType.error,
        impact: "Affects 12% of total traffic",
        recommendedAction: "Increase read replicas in eu-west-1",
      ),
      InsightItem(
        title: "Suboptimal Routing Configuration",
        description: "15% of requests from APJ are being routed to US East despite APJ nodes having capacity.",
        severity: "MEDIUM",
        severityBadgeType: BadgeType.warning,
        impact: "+120ms latency for APJ users",
        recommendedAction: "Review geographic routing rules",
      ),
      InsightItem(
        title: "Unused Capacity",
        description: "Worker nodes in us-west-2 are operating at < 10% CPU utilization.",
        severity: "LOW",
        severityBadgeType: BadgeType.info,
        impact: "Unnecessary infrastructure costs",
        recommendedAction: "Scale down minimum node count",
      ),
    ];
  }
}
