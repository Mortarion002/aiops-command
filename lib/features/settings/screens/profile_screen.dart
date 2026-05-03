import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../auth/providers/auth_provider.dart';
import '../../auth/providers/user_profile_provider.dart';
import '../../auth/models/app_user.dart';
import '../../auth/repositories/user_repository.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).value;
    final appUserAsync = ref.watch(currentUserProfileProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Text("Profile", style: AppTextStyles.h2),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              // Avatar placeholder
              const CircleAvatar(
                radius: 48,
                backgroundColor: AppColors.surfaceContainer,
                child: Icon(Icons.person, size: 48, color: AppColors.mutedText),
              ),
              const SizedBox(height: 32),
              
              // Information Fields
              _buildInfoField("Name", user?.displayName ?? "Not provided"),
              const SizedBox(height: 16),
              _buildInfoField("Email", user?.email ?? "No email"),
              const SizedBox(height: 16),
              
              appUserAsync.when(
                data: (appUser) {
                  return Row(
                    children: [
                      Expanded(
                        child: _buildInfoField("Age", appUser?.age?.toString() ?? "Not provided"),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () => _showEditAgeDialog(context, ref, appUser),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.surface,
                          foregroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        ),
                        child: const Text("Edit"),
                      ),
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, __) => _buildInfoField("Age", "Error loading data"),
              ),
              
              const SizedBox(height: 48),
              
              // Action Buttons
              OutlinedButton(
                onPressed: () {
                  if (user?.email != null) {
                    ref.read(authProvider.notifier).sendPasswordResetEmail(user!.email!);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password reset email sent')),
                    );
                  }
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: AppColors.outline),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("Reset Password", style: AppTextStyles.bodyLg),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(authProvider.notifier).signOut();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error.withOpacity(0.1),
                  foregroundColor: AppColors.error,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("Sign Out", style: AppTextStyles.bodyLg.copyWith(fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: AppTextStyles.labelCaps.copyWith(color: AppColors.mutedText)),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.outlineVariant),
          ),
          child: Text(value, style: AppTextStyles.bodyLg),
        ),
      ],
    );
  }

  void _showEditAgeDialog(BuildContext context, WidgetRef ref, AppUser? appUser) {
    if (appUser == null) return;
    
    final controller = TextEditingController(text: appUser.age?.toString() ?? "");
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surfaceContainer,
        title: Text("Edit Age", style: AppTextStyles.h2),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: AppTextStyles.bodyLg,
          decoration: InputDecoration(
            hintText: "Enter your age",
            hintStyle: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText),
            filled: true,
            fillColor: AppColors.surface,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text("Cancel", style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText)),
          ),
          ElevatedButton(
            onPressed: () async {
              final newAge = int.tryParse(controller.text);
              if (newAge != null) {
                final updatedUser = appUser.copyWith(age: newAge);
                await ref.read(userRepositoryProvider).updateUser(updatedUser);
                ref.invalidate(currentUserProfileProvider); // refresh UI
              }
              if (context.mounted) context.pop();
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.black),
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
