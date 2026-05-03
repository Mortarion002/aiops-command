import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../models/log_entry_model.dart';

class LogViewer extends StatelessWidget {
  final List<LogEntry> logs;

  const LogViewer({super.key, required this.logs});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ListView.separated(
          itemCount: logs.length,
          separatorBuilder: (context, index) =>
              const Divider(color: AppColors.outlineVariant, height: 1),
          itemBuilder: (context, index) {
            final log = logs[index];
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      log.timestamp,
                      style: AppTextStyles.monoKey.copyWith(
                        color: AppColors.mutedText,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 60,
                    child: Text(
                      log.level,
                      style: AppTextStyles.monoKey.copyWith(
                        color: _getLevelColor(log.level),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "[${log.service}] ${log.message}",
                          style: AppTextStyles.monoKey.copyWith(
                            color: AppColors.onBackground,
                          ),
                        ),
                        if (log.metadata.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            log.metadata.entries
                                .map((e) => "${e.key}: ${e.value}")
                                .join(" | "),
                            style: AppTextStyles.monoKey.copyWith(
                              color: AppColors.mutedText,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Color _getLevelColor(String level) {
    switch (level) {
      case 'INFO':
        return AppColors.primary;
      case 'WARN':
        return AppColors.warning;
      case 'ERROR':
        return AppColors.error;
      default:
        return AppColors.mutedText;
    }
  }
}
