// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insights_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(insightsRepository)
final insightsRepositoryProvider = InsightsRepositoryProvider._();

final class InsightsRepositoryProvider
    extends
        $FunctionalProvider<
          IInsightsRepository,
          IInsightsRepository,
          IInsightsRepository
        >
    with $Provider<IInsightsRepository> {
  InsightsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'insightsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$insightsRepositoryHash();

  @$internal
  @override
  $ProviderElement<IInsightsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IInsightsRepository create(Ref ref) {
    return insightsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IInsightsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IInsightsRepository>(value),
    );
  }
}

String _$insightsRepositoryHash() =>
    r'39c2578ccd7cdfcb0425851c41d8fe83036b3c84';

@ProviderFor(insightsData)
final insightsDataProvider = InsightsDataProvider._();

final class InsightsDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<InsightItem>>,
          List<InsightItem>,
          FutureOr<List<InsightItem>>
        >
    with
        $FutureModifier<List<InsightItem>>,
        $FutureProvider<List<InsightItem>> {
  InsightsDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'insightsDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$insightsDataHash();

  @$internal
  @override
  $FutureProviderElement<List<InsightItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<InsightItem>> create(Ref ref) {
    return insightsData(ref);
  }
}

String _$insightsDataHash() => r'd7453938ee4a8eaa5619568adf9507b8e7d5dad2';
