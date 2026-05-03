import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date_range_provider.g.dart';

enum DateRange { today, last7Days, last30Days, allTime }

@riverpod
class DateRangeNotifier extends _$DateRangeNotifier {
  @override
  DateRange build() => DateRange.last7Days;

  void setRange(DateRange range) {
    if (state == range) return;
    state = range;
  }
}
