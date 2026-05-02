class RecentActivityItem {
  final String message;
  final String timeAgo;
  final String source;
  final bool isHighlight;

  RecentActivityItem({
    required this.message,
    required this.timeAgo,
    required this.source,
    this.isHighlight = false,
  });
}
