import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

/// A pool of fake API keys that rotate on create/delete.
const _keyPool = [
  'sk-aiops-f7a3b2c1d4e5f6a7b8c9d0e1f2a3b4c5',
  'sk-aiops-1e2d3c4b5a6f7e8d9c0b1a2f3e4d5c6b',
  'sk-aiops-9f8e7d6c5b4a3f2e1d0c9b8a7f6e5d4c',
  'sk-aiops-a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6',
  'sk-aiops-2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e',
  'sk-aiops-c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9',
  'sk-aiops-e8f9a0b1c2d3e4f5a6b7c8d9e0f1a2b3',
  'sk-aiops-3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a',
  'sk-aiops-7c8d9e0f1a2b3c4d5e6f7a8b9c0d1e2f',
  'sk-aiops-5a6b7c8d9e0f1a2b3c4d5e6f7a8b9c0d',
  'sk-aiops-b0c1d2e3f4a5b6c7d8e9f0a1b2c3d4e5',
  'sk-aiops-d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1',
  'sk-aiops-8a9b0c1d2e3f4a5b6c7d8e9f0a1b2c3d',
  'sk-aiops-4f5a6b7c8d9e0f1a2b3c4d5e6f7a8b9c',
  'sk-aiops-0d1e2f3a4b5c6d7e8f9a0b1c2d3e4f5a',
];

const _labelPool = [
  'Production Server',
  'Staging Environment',
  'CI/CD Pipeline',
  'Local Dev',
  'Mobile Client',
  'Admin Dashboard',
  'Monitoring Agent',
  'Analytics Service',
  'Backup Worker',
  'Edge Function',
  'Webhook Handler',
  'Batch Processor',
  'Test Runner',
  'Deployment Bot',
  'Health Checker',
];

class _ApiKey {
  final String key;
  final String label;
  final DateTime createdAt;

  _ApiKey({required this.key, required this.label, required this.createdAt});
}

class ApiKeysScreen extends StatefulWidget {
  const ApiKeysScreen({super.key});

  @override
  State<ApiKeysScreen> createState() => _ApiKeysScreenState();
}

class _ApiKeysScreenState extends State<ApiKeysScreen> {
  late List<_ApiKey> _keys;
  int _poolIndex = 3; // next index into pool

  @override
  void initState() {
    super.initState();
    // Start with 3 keys already active
    _keys = [
      _ApiKey(
        key: _keyPool[0],
        label: _labelPool[0],
        createdAt: DateTime.now().subtract(const Duration(days: 45)),
      ),
      _ApiKey(
        key: _keyPool[1],
        label: _labelPool[1],
        createdAt: DateTime.now().subtract(const Duration(days: 12)),
      ),
      _ApiKey(
        key: _keyPool[2],
        label: _labelPool[2],
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }

  String _mask(String key) {
    if (key.length <= 12) return key;
    return '${key.substring(0, 10)}${'•' * 18}${key.substring(key.length - 6)}';
  }

  String _timeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'Just now';
  }

  void _generateKey() {
    final nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        backgroundColor: AppColors.surfaceContainer,
        title: Text('Generate API Key', style: AppTextStyles.h2),
        content: TextField(
          controller: nameController,
          autofocus: true,
          style: AppTextStyles.bodyLg,
          decoration: InputDecoration(
            hintText: 'Key label (e.g. Production)',
            hintStyle: AppTextStyles.bodyMd.copyWith(
              color: AppColors.mutedText,
            ),
            filled: true,
            fillColor: AppColors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogCtx).pop(),
            child: Text(
              'Cancel',
              style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final label = nameController.text.trim().isEmpty
                  ? _labelPool[_poolIndex % _labelPool.length]
                  : nameController.text.trim();

              setState(() {
                _keys.insert(
                  0,
                  _ApiKey(
                    key: _keyPool[_poolIndex % _keyPool.length],
                    label: label,
                    createdAt: DateTime.now(),
                  ),
                );
                _poolIndex++;
              });
              Navigator.of(dialogCtx).pop();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.surfaceContainerHigh,
                  content: Text(
                    'API key generated',
                    style: AppTextStyles.bodyMd,
                  ),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.black,
            ),
            child: const Text('Generate'),
          ),
        ],
      ),
    );
  }

  void _revokeKey(int index) {
    final key = _keys[index];
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        backgroundColor: AppColors.surfaceContainer,
        title: Text('Revoke Key', style: AppTextStyles.h2),
        content: RichText(
          text: TextSpan(
            style: AppTextStyles.bodyMd,
            children: [
              const TextSpan(text: 'Are you sure you want to revoke '),
              TextSpan(
                text: key.label,
                style: AppTextStyles.bodyMd.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.warning,
                ),
              ),
              const TextSpan(
                text:
                    '?\n\nThis action cannot be undone. Any service using this key will lose access immediately.',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogCtx).pop(),
            child: Text(
              'Cancel',
              style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => _keys.removeAt(index));
              Navigator.of(dialogCtx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.errorContainer,
                  content: Text(
                    'Key revoked: ${key.label}',
                    style: AppTextStyles.bodyMd,
                  ),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error.withValues(alpha: 0.15),
              foregroundColor: AppColors.error,
              elevation: 0,
            ),
            child: const Text('Revoke'),
          ),
        ],
      ),
    );
  }

  void _copyKey(String key) {
    Clipboard.setData(ClipboardData(text: key));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.surfaceContainerHigh,
        content: Text('Key copied to clipboard', style: AppTextStyles.bodyMd),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
      ),
    );
  }

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
        title: Text('API Keys', style: AppTextStyles.h2),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline,
              color: AppColors.primary,
            ),
            tooltip: 'Generate new key',
            onPressed: _generateKey,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: _keys.isEmpty
            ? _buildEmptyState()
            : ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                itemCount: _keys.length + 1, // +1 for the header info card
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  if (index == 0) return _buildInfoCard();
                  return _buildKeyCard(_keys[index - 1], index - 1);
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _generateKey,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        icon: const Icon(Icons.add),
        label: const Text('Generate Key'),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: AppColors.accent, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'API keys grant full access to AIOps Command. Keep them secret and rotate regularly.',
              style: AppTextStyles.bodyMd.copyWith(
                color: AppColors.accent,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.vpn_key_off,
                size: 36,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 24),
            Text('No API Keys', style: AppTextStyles.h2),
            const SizedBox(height: 8),
            Text(
              'Generate your first API key to start integrating with the AIOps Command CLI.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMd.copyWith(
                color: AppColors.mutedText,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _generateKey,
              icon: const Icon(Icons.add),
              label: const Text('Generate Key'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyCard(_ApiKey apiKey, int index) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row: label + status badge
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    apiKey.label,
                    style: AppTextStyles.bodyLg.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Active',
                    style: AppTextStyles.bodyMd.copyWith(
                      color: AppColors.success,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Key value (masked)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _mask(apiKey.key),
                style: AppTextStyles.bodyMd.copyWith(
                  fontFamily: 'monospace',
                  letterSpacing: 0.5,
                  color: AppColors.mutedText,
                ),
              ),
            ),
          ),

          // Footer: created date + action buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 8, 8),
            child: Row(
              children: [
                Icon(Icons.schedule, size: 14, color: AppColors.mutedText),
                const SizedBox(width: 6),
                Text(
                  'Created ${_timeAgo(apiKey.createdAt)}',
                  style: AppTextStyles.bodyMd.copyWith(
                    color: AppColors.mutedText,
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.copy, size: 18),
                  color: AppColors.mutedText,
                  tooltip: 'Copy key',
                  onPressed: () => _copyKey(apiKey.key),
                  visualDensity: VisualDensity.compact,
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: 18),
                  color: AppColors.error,
                  tooltip: 'Revoke key',
                  onPressed: () => _revokeKey(index),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
