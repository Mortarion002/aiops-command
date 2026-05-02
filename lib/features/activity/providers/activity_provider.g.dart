// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(activityRepository)
final activityRepositoryProvider = ActivityRepositoryProvider._();

final class ActivityRepositoryProvider
    extends
        $FunctionalProvider<
          IActivityRepository,
          IActivityRepository,
          IActivityRepository
        >
    with $Provider<IActivityRepository> {
  ActivityRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activityRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activityRepositoryHash();

  @$internal
  @override
  $ProviderElement<IActivityRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IActivityRepository create(Ref ref) {
    return activityRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IActivityRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IActivityRepository>(value),
    );
  }
}

String _$activityRepositoryHash() =>
    r'0f53611113cc9c7cb3205b15e648c6b04a6256e0';

@ProviderFor(LogFilterNotifier)
final logFilterProvider = LogFilterNotifierProvider._();

final class LogFilterNotifierProvider
    extends $NotifierProvider<LogFilterNotifier, String> {
  LogFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logFilterNotifierHash();

  @$internal
  @override
  LogFilterNotifier create() => LogFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$logFilterNotifierHash() => r'6217f4a9beb53d9370c5da64f1163e8cc7e5c627';

abstract class _$LogFilterNotifier extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(logsData)
final logsDataProvider = LogsDataProvider._();

final class LogsDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LogEntry>>,
          List<LogEntry>,
          FutureOr<List<LogEntry>>
        >
    with $FutureModifier<List<LogEntry>>, $FutureProvider<List<LogEntry>> {
  LogsDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logsDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logsDataHash();

  @$internal
  @override
  $FutureProviderElement<List<LogEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LogEntry>> create(Ref ref) {
    return logsData(ref);
  }
}

String _$logsDataHash() => r'5f40ebc7b468c8bad210f7a72109f4e4d4026c44';
