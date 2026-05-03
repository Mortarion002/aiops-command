import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/section_label.dart';
import '../../../shared/widgets/divider_line.dart';
import '../../auth/providers/auth_provider.dart';
import '../models/setting_item_model.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sections = [
      SettingSection(
        title: "Account",
        items: [
          SettingItem(
            title: "Profile",
            subtitle: "Manage your personal information",
            icon: Icons.person_outline,
            onTap: () => context.push('/profile'),
          ),
          SettingItem(
            title: "API Keys",
            subtitle: "Manage access tokens for CLI",
            icon: Icons.vpn_key_outlined,
            onTap: () {},
          ),
        ],
      ),
      SettingSection(
        title: "Preferences",
        items: [
          SettingItem(
            title: "Notifications",
            subtitle: "Configure alerts and digests",
            icon: Icons.notifications_none,
            onTap: () {},
          ),
          SettingItem(
            title: "Theme",
            subtitle: "Dark Mode (Default)",
            icon: Icons.dark_mode_outlined,
            onTap: () {},
            trailing: const Icon(Icons.check, color: AppColors.primary, size: 20),
          ),
        ],
      ),
      SettingSection(
        title: "Support",
        items: [
          SettingItem(
            title: "Documentation",
            icon: Icons.description_outlined,
            onTap: () {},
          ),
          SettingItem(
            title: "Sign Out",
            icon: Icons.logout,
            onTap: () => ref.read(authProvider.notifier).signOut(),
          ),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(24.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Text("Settings", style: AppTextStyles.h1),
                  const SizedBox(height: 24),
                  ...sections.map((section) => _buildSection(section)),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(SettingSection section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(section.title),
        const SizedBox(height: 8),
        AppCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: section.items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Icon(item.icon, color: AppColors.mutedText, size: 24),
                    title: Text(item.title, style: AppTextStyles.bodyLg),
                    subtitle: item.subtitle != null 
                        ? Text(item.subtitle!, style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText))
                        : null,
                    trailing: item.trailing ?? const Icon(Icons.chevron_right, color: AppColors.outlineVariant, size: 20),
                    onTap: item.onTap,
                  ),
                  if (index < section.items.length - 1) const DividerLine(),
                ],
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
