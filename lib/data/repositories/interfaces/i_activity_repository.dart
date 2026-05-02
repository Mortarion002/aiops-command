import '../../../features/activity/models/log_entry_model.dart';

abstract class IActivityRepository {
  Future<List<LogEntry>> getLogs(String filter);
}
