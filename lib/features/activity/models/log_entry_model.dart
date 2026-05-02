class LogEntry {
  final String timestamp;
  final String level;
  final String service;
  final String message;
  final Map<String, dynamic> metadata;

  LogEntry({
    required this.timestamp,
    required this.level,
    required this.service,
    required this.message,
    this.metadata = const {},
  });
}
