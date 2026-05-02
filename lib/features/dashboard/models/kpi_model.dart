import '../../../shared/widgets/pill_badge.dart';

class KpiSnapshot {
  final String requests;
  final String requestsBadge;
  final BadgeType requestsBadgeType;
  
  final String latency;
  final String latencyBadge;
  final BadgeType latencyBadgeType;
  
  final String errorRate;
  final String errorBadge;
  final BadgeType errorBadgeType;
  
  final String activeNodes;
  final String nodesBadge;
  final BadgeType nodesBadgeType;

  KpiSnapshot({
    required this.requests,
    required this.requestsBadge,
    required this.requestsBadgeType,
    required this.latency,
    required this.latencyBadge,
    required this.latencyBadgeType,
    required this.errorRate,
    required this.errorBadge,
    required this.errorBadgeType,
    required this.activeNodes,
    required this.nodesBadge,
    required this.nodesBadgeType,
  });
}
