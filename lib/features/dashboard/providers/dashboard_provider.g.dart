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
    r'10d8ac273402851cb19fc2f4b7d8fd1b5c1f4f07';

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

String _$kpiDataHash() => r'f10262c6993e098597bc368dc81bddf8cc780e12';

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

String _$systemHealthDataHash() => r'c81e9f23262e160904f9254fbca517aa8946516b';

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

String _$routingLanesDataHash() => r'ec315e8a7fe7439d3a18440bb07958aa972957dd';

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

String _$requestVolumeDataHash() => r'dabb2a2e405890c6ed9ff23f4b865dfa8b59bdb6';

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
    r'6b2c416ba7d0ccb46effc89a40a318e0e897fae3';
