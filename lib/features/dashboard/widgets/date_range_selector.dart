import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../providers/date_range_provider.dart';

class DateRangeSelector extends ConsumerWidget {
  const DateRangeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRange = ref.watch(dateRangeProvider);
    final label = _getLabel(currentRange);

    return InkWell(
      onTap: () => _showPicker(context, ref),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.outline),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: AppTextStyles.bodyMd),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, size: 16, color: AppColors.mutedText),
          ],
        ),
      ),
    );
  }

  String _getLabel(DateRange range) {
    switch (range) {
      case DateRange.today: return 'Today';
      case DateRange.last7Days: return 'Last 7 Days';
      case DateRange.last30Days: return 'Last 30 Days';
      case DateRange.allTime: return 'All Time';
    }
  }

  void _showPicker(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surfaceContainer,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: DateRange.values.map((range) {
              return ListTile(
                title: Text(_getLabel(range), style: AppTextStyles.bodyMd),
                onTap: () {
                  ref.read(dateRangeProvider.notifier).setRange(range);
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
