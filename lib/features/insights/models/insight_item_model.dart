import '../../../shared/widgets/pill_badge.dart';

class InsightItem {
  final String title;
  final String description;
  final String severity;
  final BadgeType severityBadgeType;
  final String impact;
  final String recommendedAction;

  InsightItem({
    required this.title,
    required this.description,
    required this.severity,
    required this.severityBadgeType,
    required this.impact,
    required this.recommendedAction,
  });
}
