import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class _DocSection {
  final String title;
  final IconData icon;
  final List<_DocArticle> articles;

  const _DocSection({required this.title, required this.icon, required this.articles});
}

class _DocArticle {
  final String title;
  final String body;

  const _DocArticle({required this.title, required this.body});
}

const _sections = [
  _DocSection(
    title: 'Getting Started',
    icon: Icons.rocket_launch_outlined,
    articles: [
      _DocArticle(
        title: 'What is AIOps Command?',
        body:
            'AIOps Command is an intelligent operations platform that combines AI-driven insights '
            'with real-time infrastructure monitoring. It provides a unified dashboard for tracking '
            'system health, model performance, routing efficiency, and cost optimization across your '
            'entire AI/ML stack.\n\n'
            'Key capabilities include:\n'
            '• Real-time KPI monitoring (latency, throughput, error rate, uptime)\n'
            '• Automated anomaly detection and alerting\n'
            '• Model drift tracking and retraining triggers\n'
            '• Cost analysis and optimization recommendations\n'
            '• Multi-environment deployment management',
      ),
      _DocArticle(
        title: 'Creating Your Account',
        body:
            'To get started with AIOps Command:\n\n'
            '1. Tap "Get Started" on the onboarding screen\n'
            '2. Enter your full name, email address, age, and a secure password (minimum 8 characters)\n'
            '3. Tap "Create Account" — your profile is automatically provisioned\n'
            '4. You\'ll be redirected to the Dashboard immediately after sign-up\n\n'
            'Your account includes access to all four main sections: Dashboard, Activity, Insights, and Settings.',
      ),
      _DocArticle(
        title: 'Navigating the App',
        body:
            'AIOps Command is organized into four main tabs:\n\n'
            '📊  Dashboard — At-a-glance KPIs, system health score, and routing lane status\n'
            '📋  Activity — Real-time event feed of deployments, alerts, and system changes\n'
            '💡  Insights — AI-generated recommendations and performance analysis\n'
            '⚙️  Settings — Account management, API keys, notifications, and preferences\n\n'
            'Use the bottom navigation bar to switch between tabs. Each tab preserves its scroll position when you switch away and come back.',
      ),
    ],
  ),
  _DocSection(
    title: 'Dashboard',
    icon: Icons.dashboard_outlined,
    articles: [
      _DocArticle(
        title: 'Understanding KPI Cards',
        body:
            'The dashboard displays four primary KPI cards:\n\n'
            '• Avg Latency — Mean response time across all endpoints in milliseconds. '
            'Values below 200ms are considered healthy.\n\n'
            '• Throughput — Requests processed per second. Tracked against your baseline to detect drops.\n\n'
            '• Error Rate — Percentage of 4xx/5xx responses. An error rate above 1% triggers a warning.\n\n'
            '• Uptime — Overall system availability as a percentage. Target is 99.9% (three nines).\n\n'
            'Each card shows a colored indicator: green (healthy), yellow (warning), red (critical).',
      ),
      _DocArticle(
        title: 'System Health Score',
        body:
            'The System Health section provides a composite score from 0–100 based on:\n\n'
            '• Infrastructure availability (30% weight)\n'
            '• API response times (25% weight)\n'
            '• Error rates (25% weight)\n'
            '• Resource utilization — CPU, memory, GPU (20% weight)\n\n'
            'Scores above 85 are green, 60–85 are yellow, and below 60 are red. '
            'The score updates every 30 seconds in production.',
      ),
      _DocArticle(
        title: 'Routing Lanes',
        body:
            'Routing Lanes show the status of your AI model serving infrastructure:\n\n'
            '• Primary Lane — Main production traffic path\n'
            '• Fallback Lane — Activated when primary latency exceeds thresholds\n'
            '• Shadow Lane — Used for A/B testing and canary deployments\n\n'
            'Each lane displays its current load percentage, active model version, and health status.',
      ),
    ],
  ),
  _DocSection(
    title: 'API Keys',
    icon: Icons.vpn_key_outlined,
    articles: [
      _DocArticle(
        title: 'Generating API Keys',
        body:
            'API keys allow external services and CLI tools to authenticate with AIOps Command.\n\n'
            'To generate a new key:\n'
            '1. Navigate to Settings → API Keys\n'
            '2. Tap the "Generate Key" button\n'
            '3. Enter a descriptive label (e.g., "Production Server", "CI/CD Pipeline")\n'
            '4. Tap "Generate"\n\n'
            'The key is displayed once. Copy it immediately and store it securely — '
            'you won\'t be able to view the full key again.',
      ),
      _DocArticle(
        title: 'Revoking API Keys',
        body:
            'If a key is compromised or no longer needed:\n\n'
            '1. Navigate to Settings → API Keys\n'
            '2. Find the key you want to revoke\n'
            '3. Tap the red trash icon\n'
            '4. Confirm the revocation in the dialog\n\n'
            '⚠️ Revocation is immediate and irreversible. Any service using that key will '
            'lose access instantly. Make sure to rotate to a new key before revoking the old one.',
      ),
      _DocArticle(
        title: 'API Key Best Practices',
        body:
            '• Never commit API keys to version control\n'
            '• Use environment variables or a secrets manager\n'
            '• Rotate keys every 90 days\n'
            '• Use separate keys for each environment (dev, staging, prod)\n'
            '• Monitor the Activity feed for unauthorized API usage\n'
            '• Revoke keys immediately if a team member leaves',
      ),
    ],
  ),
  _DocSection(
    title: 'Notifications',
    icon: Icons.notifications_outlined,
    articles: [
      _DocArticle(
        title: 'Configuring Alerts',
        body:
            'AIOps Command supports seven alert categories:\n\n'
            '• Critical Incidents — P0/P1 system outages\n'
            '• Performance Degradation — Latency spikes, throughput drops\n'
            '• Model Drift — Accuracy degradation, data distribution changes\n'
            '• Deployment Events — Build, rollback, canary promotion\n'
            '• Cost Alerts — Budget threshold breaches\n'
            '• Security Events — Auth failures, suspicious access\n'
            '• Scheduled Maintenance — Upcoming maintenance windows\n\n'
            'Each category can be individually toggled on or off. Use the master toggle to pause all notifications at once.',
      ),
      _DocArticle(
        title: 'Delivery Channels',
        body:
            'Alerts can be delivered through three channels:\n\n'
            '📱 Push Notifications — Real-time alerts on your mobile device\n'
            '📧 Email — Sent to your registered account email\n'
            '💬 Slack — Posted to your configured #ops-alerts channel\n\n'
            'Enable or disable each channel independently from Settings → Notifications.',
      ),
      _DocArticle(
        title: 'Quiet Hours',
        body:
            'Quiet Hours suppress non-critical notifications during your off-hours (default: 10 PM – 7 AM).\n\n'
            'During quiet hours:\n'
            '• Critical Incidents still trigger immediately\n'
            '• All other alerts are batched and delivered when quiet hours end\n'
            '• The digest email includes a summary of suppressed alerts\n\n'
            'You can customize the quiet hours window from the Notifications settings.',
      ),
    ],
  ),
  _DocSection(
    title: 'Account & Security',
    icon: Icons.shield_outlined,
    articles: [
      _DocArticle(
        title: 'Managing Your Profile',
        body:
            'Your profile is accessible from Settings → Profile. From there you can:\n\n'
            '• View your name and email (synced from Firebase Auth)\n'
            '• Edit your age\n'
            '• Send a password reset email to your registered address\n'
            '• Sign out of your account\n\n'
            'Profile changes are saved to Firestore and synced across all sessions.',
      ),
      _DocArticle(
        title: 'Password Reset',
        body:
            'If you forget your password:\n\n'
            '1. From the login screen, tap "Forgot password?"\n'
            '2. Enter your registered email\n'
            '3. Check your inbox for the reset link from Firebase\n'
            '4. Follow the link to set a new password\n\n'
            'You can also trigger a reset from Settings → Profile → "Reset Password".',
      ),
    ],
  ),
];

class DocumentationScreen extends StatefulWidget {
  const DocumentationScreen({super.key});

  @override
  State<DocumentationScreen> createState() => _DocumentationScreenState();
}

class _DocumentationScreenState extends State<DocumentationScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<_DocSection> get _filteredSections {
    if (_searchQuery.isEmpty) return _sections;

    final q = _searchQuery.toLowerCase();
    return _sections
        .map((section) {
          final matchingArticles = section.articles
              .where((a) =>
                  a.title.toLowerCase().contains(q) ||
                  a.body.toLowerCase().contains(q))
              .toList();
          if (matchingArticles.isEmpty) return null;
          return _DocSection(
            title: section.title,
            icon: section.icon,
            articles: matchingArticles,
          );
        })
        .whereType<_DocSection>()
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final sections = _filteredSections;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Documentation', style: AppTextStyles.h2),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ── Search bar ─────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
              child: TextField(
                controller: _searchController,
                onChanged: (v) => setState(() => _searchQuery = v),
                style: AppTextStyles.bodyLg,
                decoration: InputDecoration(
                  hintText: 'Search docs...',
                  hintStyle: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText),
                  prefixIcon: const Icon(Icons.search, color: AppColors.mutedText, size: 20),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close, size: 18, color: AppColors.mutedText),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: AppColors.surface,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.outline),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.outline),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.accent, width: 1.5),
                  ),
                ),
              ),
            ),

            // ── Content ────────────────────────────────────────────────
            Expanded(
              child: sections.isEmpty
                  ? _buildEmptySearch()
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: sections.length,
                      itemBuilder: (context, i) => _buildSection(sections[i]),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptySearch() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off, size: 48, color: AppColors.mutedText),
          const SizedBox(height: 16),
          Text('No results found', style: AppTextStyles.h3),
          const SizedBox(height: 6),
          Text(
            'Try a different search term',
            style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(_DocSection section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 10),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(section.icon, size: 16, color: AppColors.accent),
              ),
              const SizedBox(width: 10),
              Text(
                section.title,
                style: AppTextStyles.bodyLg.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              const Spacer(),
              Text(
                '${section.articles.length} articles',
                style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText, fontSize: 11),
              ),
            ],
          ),
        ),

        // Article cards
        ...section.articles.map((article) => _ArticleTile(article: article)),
        const SizedBox(height: 20),
      ],
    );
  }
}

// ── Expandable article tile ──────────────────────────────────────────────

class _ArticleTile extends StatefulWidget {
  final _DocArticle article;
  const _ArticleTile({required this.article});

  @override
  State<_ArticleTile> createState() => _ArticleTileState();
}

class _ArticleTileState extends State<_ArticleTile>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: _expanded ? AppColors.surfaceContainer : AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _expanded ? AppColors.accent.withOpacity(0.3) : AppColors.outline,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title row
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => setState(() => _expanded = !_expanded),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.article.title,
                        style: AppTextStyles.bodyLg.copyWith(
                          fontSize: 14,
                          fontWeight: _expanded ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      turns: _expanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        Icons.expand_more,
                        size: 20,
                        color: _expanded ? AppColors.accent : AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Body (animated)
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Text(
                  widget.article.body,
                  style: AppTextStyles.bodyMd.copyWith(
                    color: AppColors.mutedText,
                    height: 1.6,
                    fontSize: 13,
                  ),
                ),
              ),
              crossFadeState:
                  _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 250),
            ),
          ],
        ),
      ),
    );
  }
}
