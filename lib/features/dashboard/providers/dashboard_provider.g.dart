// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashboardRepository)
final dashboardRepositoryProvider = DashboardRepositoryProvider._();

final class DashboardRepositoryProvider
    extends
        $FunctionalProvider<
          IDashboardRepository,
          IDashboardRepository,
          IDashboardRepository
        >
    with $Provider<IDashboardRepository> {
  DashboardRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardRepositoryHash();

  @$internal
  @override
  $ProviderElement<IDashboardRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IDashboardRepository create(Ref ref) {
    return dashboardRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IDashboardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IDashboardRepository>(value),
    );
  }
}

String _$dashboardRepositoryHash() =>
    r'f9775ae11cc2ffd5f2c20532cb6606ed1d0aa33b';

@ProviderFor(kpiData)
final kpiDataProvider = KpiDataProvider._();

final class KpiDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<KpiSnapshot>,
          KpiSnapshot,
          FutureOr<KpiSnapshot>
        >
    with $FutureModifier<KpiSnapshot>, $FutureProvider<KpiSnapshot> {
  KpiDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'kpiDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$kpiDataHash();

  @$internal
  @override
  $FutureProviderElement<KpiSnapshot> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<KpiSnapshot> create(Ref ref) {
    return kpiData(ref);
  }
}

String _$kpiDataHash() => r'46b078d6913ea83ace0eb0d6d3fb5004ffaab4d8';

@ProviderFor(systemHealthData)
final systemHealthDataProvider = SystemHealthDataProvider._();

final class SystemHealthDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<HealthItem>>,
          List<HealthItem>,
          FutureOr<List<HealthItem>>
        >
    with $FutureModifier<List<HealthItem>>, $FutureProvider<List<HealthItem>> {
  SystemHealthDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'systemHealthDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$systemHealthDataHash();

  @$internal
  @override
  $FutureProviderElement<List<HealthItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<HealthItem>> create(Ref ref) {
    return systemHealthData(ref);
  }
}

String _$systemHealthDataHash() => r'af3713a4fb7a678270f81bec4b2fc273e8c33d99';

@ProviderFor(routingLanesData)
final routingLanesDataProvider = RoutingLanesDataProvider._();

final class RoutingLanesDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RoutingLane>>,
          List<RoutingLane>,
          FutureOr<List<RoutingLane>>
        >
    with
        $FutureModifier<List<RoutingLane>>,
        $FutureProvider<List<RoutingLane>> {
  RoutingLanesDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routingLanesDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routingLanesDataHash();

  @$internal
  @override
  $FutureProviderElement<List<RoutingLane>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<RoutingLane>> create(Ref ref) {
    return routingLanesData(ref);
  }
}

String _$routingLanesDataHash() => r'930c25135fb3dbf75e9406207c6951e28bc4bbbc';

@ProviderFor(requestVolumeData)
final requestVolumeDataProvider = RequestVolumeDataProvider._();

final class RequestVolumeDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ChartPoint>>,
          List<ChartPoint>,
          FutureOr<List<ChartPoint>>
        >
    with $FutureModifier<List<ChartPoint>>, $FutureProvider<List<ChartPoint>> {
  RequestVolumeDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'requestVolumeDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$requestVolumeDataHash();

  @$internal
  @override
  $FutureProviderElement<List<ChartPoint>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ChartPoint>> create(Ref ref) {
    return requestVolumeData(ref);
  }
}

String _$requestVolumeDataHash() => r'87b2ea0262ab7d4c9fcbb63c4e3d40c558e5aad3';

@ProviderFor(recentActivityData)
final recentActivityDataProvider = RecentActivityDataProvider._();

final class RecentActivityDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RecentActivityItem>>,
          List<RecentActivityItem>,
          FutureOr<List<RecentActivityItem>>
        >
    with
        $FutureModifier<List<RecentActivityItem>>,
        $FutureProvider<List<RecentActivityItem>> {
  RecentActivityDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentActivityDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentActivityDataHash();

  @$internal
  @override
  $FutureProviderElement<List<RecentActivityItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<RecentActivityItem>> create(Ref ref) {
    return recentActivityData(ref);
  }
}

String _$recentActivityDataHash() =>
    r'd58f9f8e89f5b45e7efb5b47e8c750d5e36fbbd0';
