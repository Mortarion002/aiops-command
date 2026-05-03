import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/section_label.dart';
import '../../../shared/widgets/divider_line.dart';
import '../models/health_item_model.dart';

class SystemHealthSection extends StatelessWidget {
  final List<HealthItem> items;

  const SystemHealthSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel("System Health"),
        const SizedBox(height: 8),
        AppCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    leading: Icon(
                      _getIcon(item.name),
                      color: AppColors.mutedText,
                      size: 20,
                    ),
                    title: Text(item.name, style: AppTextStyles.bodyMd),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item.status,
                          style: AppTextStyles.bodyMd.copyWith(
                            color: _getStatusColor(item),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.chevron_right,
                          color: AppColors.outlineVariant,
                          size: 20,
                        ),
                      ],
                    ),
                    onTap: () => _handleTap(context, item.name),
                  ),
                  if (index < items.length - 1) const DividerLine(),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  IconData _getIcon(String name) {
    if (name == 'Gateway') return Icons.router;
    if (name == 'Vector DB') return Icons.storage;
    if (name == 'Workers') return Icons.memory;
    if (name == 'Budget') return Icons.attach_money;
    return Icons.circle;
  }

  Color _getStatusColor(HealthItem item) {
    if (item.name == 'Budget') return AppColors.success;
    if (item.percentage != null) {
      if (item.percentage! >= 0.999) return AppColors.success;
      if (item.percentage! >= 0.99) return AppColors.warning;
      return AppColors.error;
    }
    return AppColors.onBackground;
  }

  void _handleTap(BuildContext context, String name) {
    if (name == 'Gateway' || name == 'Workers') context.go('/activity');
    if (name == 'Vector DB') context.go('/insights');
    if (name == 'Budget') context.go('/settings');
  }
}
