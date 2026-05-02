import '../interfaces/i_activity_repository.dart';
import '../../../features/activity/models/log_entry_model.dart';

class MockActivityRepository implements IActivityRepository {
  @override
  Future<List<LogEntry>> getLogs(String filter) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final logs = [
      LogEntry(timestamp: "10:42:01", level: "INFO", service: "Gateway", message: "Request routed to eu-west-1", metadata: {"latency": "42ms"}),
      LogEntry(timestamp: "10:41:55", level: "ERROR", service: "Vector DB", message: "Connection timeout on query", metadata: {"query_id": "8x991a"}),
      LogEntry(timestamp: "10:41:50", level: "WARN", service: "Workers", message: "CPU utilization above 80%", metadata: {"node": "worker-3"}),
      LogEntry(timestamp: "10:40:12", level: "INFO", service: "System", message: "Auto-scaling group expanded", metadata: {"capacity": "+2 nodes"}),
    ];

    if (filter == 'All') return logs;
    return logs.where((l) => l.level == filter.toUpperCase() || l.service == filter).toList();
  }
}
