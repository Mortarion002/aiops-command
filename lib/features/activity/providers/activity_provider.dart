import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/repositories/interfaces/i_activity_repository.dart';
import '../../../data/repositories/mock/mock_activity_repository.dart';
import '../models/log_entry_model.dart';

part 'activity_provider.g.dart';

@riverpod
IActivityRepository activityRepository(ActivityRepositoryRef ref) => MockActivityRepository();

@riverpod
class LogFilterNotifier extends _$LogFilterNotifier {
  @override
  String build() => 'All';

  void setFilter(String filter) => state = filter;
}

@riverpod
Future<List<LogEntry>> logsData(LogsDataRef ref) {
  final filter = ref.watch(logFilterNotifierProvider);
  return ref.watch(activityRepositoryProvider).getLogs(filter);
}
