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
    r'5394436b905ce7e3322477464a63795f25d6d1ae';

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

String _$insightsDataHash() => r'4fd3c9ff677cae7e62d533edc0e26b8f91c81aaa';
