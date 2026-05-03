import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class _NotifCategory {
  final String title;
  final String subtitle;
  final IconData icon;
  bool enabled;

  _NotifCategory({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.enabled = true,
  });
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _masterToggle = true;

  // Delivery channels
  bool _pushEnabled = true;
  bool _emailEnabled = false;
  bool _slackEnabled = true;

  // Digest frequency
  String _digestFrequency = 'Daily';

  late final List<_NotifCategory> _alertCategories = [
    _NotifCategory(
      title: 'Critical Incidents',
      subtitle: 'System outages, P0/P1 alerts',
      icon: Icons.error_outline,
      enabled: true,
    ),
    _NotifCategory(
      title: 'Performance Degradation',
      subtitle: 'Latency spikes, throughput drops',
      icon: Icons.speed,
      enabled: true,
    ),
    _NotifCategory(
      title: 'Model Drift',
      subtitle: 'Accuracy drops, data distribution shifts',
      icon: Icons.trending_down,
      enabled: true,
    ),
    _NotifCategory(
      title: 'Deployment Events',
      subtitle: 'Build success, rollback, canary promotion',
      icon: Icons.rocket_launch_outlined,
      enabled: false,
    ),
    _NotifCategory(
      title: 'Cost Alerts',
      subtitle: 'Budget thresholds, anomalous spend',
      icon: Icons.attach_money,
      enabled: true,
    ),
    _NotifCategory(
      title: 'Security Events',
      subtitle: 'Auth failures, suspicious activity',
      icon: Icons.shield_outlined,
      enabled: true,
    ),
    _NotifCategory(
      title: 'Scheduled Maintenance',
      subtitle: 'Upcoming maintenance windows',
      icon: Icons.calendar_today_outlined,
      enabled: false,
    ),
  ];

  int get _enabledCount => _alertCategories.where((c) => c.enabled).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Notifications', style: AppTextStyles.h2),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          children: [
            // ── Master toggle ──────────────────────────────────────────
            _buildMasterToggle(),
            const SizedBox(height: 24),

            // ── Alert categories ───────────────────────────────────────
            _buildSectionHeader(
              'ALERT CATEGORIES',
              '$_enabledCount of ${_alertCategories.length} active',
            ),
            const SizedBox(height: 8),
            _buildAlertCategoriesCard(),
            const SizedBox(height: 24),

            // ── Delivery channels ──────────────────────────────────────
            _buildSectionHeader('DELIVERY CHANNELS', null),
            const SizedBox(height: 8),
            _buildDeliveryChannelsCard(),
            const SizedBox(height: 24),

            // ── Digest settings ────────────────────────────────────────
            _buildSectionHeader('DIGEST SCHEDULE', null),
            const SizedBox(height: 8),
            _buildDigestCard(),
            const SizedBox(height: 24),

            // ── Quiet hours ────────────────────────────────────────────
            _buildSectionHeader('QUIET HOURS', null),
            const SizedBox(height: 8),
            _buildQuietHoursCard(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ── Master toggle card ─────────────────────────────────────────────────

  Widget _buildMasterToggle() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _masterToggle
              ? [AppColors.accent.withOpacity(0.10), AppColors.accent.withOpacity(0.04)]
              : [AppColors.surface, AppColors.surface],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: _masterToggle ? AppColors.accent.withOpacity(0.25) : AppColors.outline,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: _masterToggle
                  ? AppColors.accent.withOpacity(0.15)
                  : AppColors.surfaceContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _masterToggle ? Icons.notifications_active : Icons.notifications_off,
              color: _masterToggle ? AppColors.accent : AppColors.mutedText,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _masterToggle ? 'Notifications On' : 'Notifications Off',
                  style: AppTextStyles.bodyLg.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  _masterToggle
                      ? '$_enabledCount alert types active'
                      : 'All notifications paused',
                  style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText, fontSize: 12),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: _masterToggle,
            onChanged: (v) => setState(() => _masterToggle = v),
            activeColor: AppColors.accent,
          ),
        ],
      ),
    );
  }

  // ── Section header ─────────────────────────────────────────────────────

  Widget _buildSectionHeader(String title, String? trailing) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.labelCaps.copyWith(
              color: AppColors.mutedText,
              letterSpacing: 1.2,
            ),
          ),
          const Spacer(),
          if (trailing != null)
            Text(
              trailing,
              style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText, fontSize: 11),
            ),
        ],
      ),
    );
  }

  // ── Alert categories card ──────────────────────────────────────────────

  Widget _buildAlertCategoriesCard() {
    return AnimatedOpacity(
      opacity: _masterToggle ? 1.0 : 0.4,
      duration: const Duration(milliseconds: 250),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.outline),
        ),
        child: Column(
          children: _alertCategories.asMap().entries.map((entry) {
            final i = entry.key;
            final cat = entry.value;
            return Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                  leading: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: cat.enabled && _masterToggle
                          ? AppColors.accent.withOpacity(0.1)
                          : AppColors.surfaceContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      cat.icon,
                      size: 18,
                      color: cat.enabled && _masterToggle
                          ? AppColors.accent
                          : AppColors.mutedText,
                    ),
                  ),
                  title: Text(cat.title, style: AppTextStyles.bodyLg.copyWith(fontSize: 14)),
                  subtitle: Text(
                    cat.subtitle,
                    style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText, fontSize: 12),
                  ),
                  trailing: Switch.adaptive(
                    value: cat.enabled && _masterToggle,
                    onChanged: _masterToggle
                        ? (v) => setState(() => cat.enabled = v)
                        : null,
                    activeColor: AppColors.accent,
                  ),
                ),
                if (i < _alertCategories.length - 1)
                  Divider(height: 1, color: AppColors.outline, indent: 16, endIndent: 16),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  // ── Delivery channels card ─────────────────────────────────────────────

  Widget _buildDeliveryChannelsCard() {
    return AnimatedOpacity(
      opacity: _masterToggle ? 1.0 : 0.4,
      duration: const Duration(milliseconds: 250),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.outline),
        ),
        child: Column(
          children: [
            _channelTile(
              icon: Icons.phone_android,
              title: 'Push Notifications',
              subtitle: 'Real-time alerts on this device',
              value: _pushEnabled,
              onChanged: (v) => setState(() => _pushEnabled = v),
            ),
            Divider(height: 1, color: AppColors.outline, indent: 16, endIndent: 16),
            _channelTile(
              icon: Icons.email_outlined,
              title: 'Email',
              subtitle: 'Sent to your account email',
              value: _emailEnabled,
              onChanged: (v) => setState(() => _emailEnabled = v),
            ),
            Divider(height: 1, color: AppColors.outline, indent: 16, endIndent: 16),
            _channelTile(
              icon: Icons.tag,
              title: 'Slack Integration',
              subtitle: '#ops-alerts channel',
              value: _slackEnabled,
              onChanged: (v) => setState(() => _slackEnabled = v),
            ),
          ],
        ),
      ),
    );
  }

  Widget _channelTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: value && _masterToggle
              ? AppColors.success.withOpacity(0.1)
              : AppColors.surfaceContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 18,
          color: value && _masterToggle ? AppColors.success : AppColors.mutedText,
        ),
      ),
      title: Text(title, style: AppTextStyles.bodyLg.copyWith(fontSize: 14)),
      subtitle: Text(
        subtitle,
        style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText, fontSize: 12),
      ),
      trailing: Switch.adaptive(
        value: value && _masterToggle,
        onChanged: _masterToggle ? onChanged : null,
        activeColor: AppColors.success,
      ),
    );
  }

  // ── Digest card ────────────────────────────────────────────────────────

  Widget _buildDigestCard() {
    final options = ['Real-time', 'Hourly', 'Daily', 'Weekly'];

    return AnimatedOpacity(
      opacity: _masterToggle ? 1.0 : 0.4,
      duration: const Duration(milliseconds: 250),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.outline),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.summarize_outlined, size: 18, color: AppColors.mutedText),
                const SizedBox(width: 10),
                Text(
                  'Email digest frequency',
                  style: AppTextStyles.bodyLg.copyWith(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: options.map((opt) {
                final selected = opt == _digestFrequency;
                return Expanded(
                  child: GestureDetector(
                    onTap: _masterToggle ? () => setState(() => _digestFrequency = opt) : null,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: EdgeInsets.only(right: opt != options.last ? 8 : 0),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.accent.withOpacity(0.12) : AppColors.surfaceContainer,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: selected ? AppColors.accent.withOpacity(0.4) : AppColors.outline,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        opt,
                        style: AppTextStyles.bodyMd.copyWith(
                          fontSize: 11,
                          fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                          color: selected ? AppColors.accent : AppColors.mutedText,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // ── Quiet hours card ───────────────────────────────────────────────────

  Widget _buildQuietHoursCard() {
    return AnimatedOpacity(
      opacity: _masterToggle ? 1.0 : 0.4,
      duration: const Duration(milliseconds: 250),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.outline),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.bedtime_outlined, size: 18, color: AppColors.mutedText),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Quiet Hours',
                    style: AppTextStyles.bodyLg.copyWith(fontSize: 14),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '10:00 PM – 7:00 AM',
                    style: AppTextStyles.bodyMd.copyWith(
                      fontSize: 12,
                      color: AppColors.mutedText,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Non-critical notifications are held until quiet hours end. Critical incidents always come through.',
              style: AppTextStyles.bodyMd.copyWith(
                color: AppColors.mutedText,
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
