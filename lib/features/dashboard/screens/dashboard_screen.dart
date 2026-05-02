import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/loading_shimmer.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/date_range_selector.dart';
import '../widgets/kpi_card.dart';
import '../widgets/system_health_section.dart';
import '../widgets/routing_lanes_card.dart';
import '../widgets/request_volume_chart.dart';
import '../widgets/recent_activity_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kpiData = ref.watch(kpiDataProvider);
    final systemHealth = ref.watch(systemHealthDataProvider);
    final routingLanes = ref.watch(routingLanesDataProvider);
    final requestVolume = ref.watch(requestVolumeDataProvider);
    final recentActivity = ref.watch(recentActivityDataProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          backgroundColor: AppColors.surfaceContainer,
          onRefresh: () async {
            ref.invalidate(kpiDataProvider);
            ref.invalidate(systemHealthDataProvider);
            ref.invalidate(routingLanesDataProvider);
            ref.invalidate(requestVolumeDataProvider);
            ref.invalidate(recentActivityDataProvider);
          },
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(24.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Dashboard", style: AppTextStyles.h1),
                        const DateRangeSelector(),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // KPIs
                    kpiData.when(
                      data: (kpis) => GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: 1.5,
                        children: [
                          KpiCard(label: "Requests", value: kpis.requests, unit: "/s", badgeText: kpis.requestsBadge, badgeType: kpis.requestsBadgeType),
                          KpiCard(label: "Latency", value: kpis.latency, unit: "P99", badgeText: kpis.latencyBadge, badgeType: kpis.latencyBadgeType),
                          KpiCard(label: "Error Rate", value: kpis.errorRate, unit: "%", badgeText: kpis.errorBadge, badgeType: kpis.errorBadgeType),
                          KpiCard(label: "Active Nodes", value: kpis.activeNodes, unit: "online", badgeText: kpis.nodesBadge, badgeType: kpis.nodesBadgeType),
                        ],
                      ),
                      loading: () => const LoadingShimmer(height: 200),
                      error: (err, stack) => Text("Error loading KPIs", style: AppTextStyles.bodyMd.copyWith(color: AppColors.error)),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Request Volume Chart
                    requestVolume.when(
                      data: (points) => RequestVolumeChart(points: points),
                      loading: () => const LoadingShimmer(height: 150),
                      error: (_, __) => const SizedBox(),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // System Health & Routing Lanes
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: systemHealth.when(
                            data: (items) => SystemHealthSection(items: items),
                            loading: () => const LoadingShimmer(height: 200),
                            error: (_, __) => const SizedBox(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 2,
                          child: routingLanes.when(
                            data: (lanes) => RoutingLanesCard(lanes: lanes),
                            loading: () => const LoadingShimmer(height: 200),
                            error: (_, __) => const SizedBox(),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Recent Activity
                    recentActivity.when(
                      data: (activities) => RecentActivityCard(activities: activities),
                      loading: () => const LoadingShimmer(height: 200),
                      error: (_, __) => const SizedBox(),
                    ),
                    
                    const SizedBox(height: 32),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
