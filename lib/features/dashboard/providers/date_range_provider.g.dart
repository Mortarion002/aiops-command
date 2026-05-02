// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_range_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DateRangeNotifier)
final dateRangeProvider = DateRangeNotifierProvider._();

final class DateRangeNotifierProvider
    extends $NotifierProvider<DateRangeNotifier, DateRange> {
  DateRangeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dateRangeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dateRangeNotifierHash();

  @$internal
  @override
  DateRangeNotifier create() => DateRangeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateRange value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateRange>(value),
    );
  }
}

String _$dateRangeNotifierHash() => r'e981d8bf32df1481e8784ff813412edb5a72654f';

abstract class _$DateRangeNotifier extends $Notifier<DateRange> {
  DateRange build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DateRange, DateRange>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DateRange, DateRange>,
              DateRange,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
