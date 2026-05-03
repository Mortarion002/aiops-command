import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_error_banner.dart';
import '../widgets/auth_primary_button.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _isSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleReset() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      ref.read(authErrorProvider.notifier).setError("Email is required");
      return;
    }

    setState(() => _isLoading = true);
    ref.read(authErrorProvider.notifier).clear();

    try {
      await ref.read(authProvider.notifier).sendPasswordResetEmail(email);
      if (!mounted) return;
      setState(() {
        _isSent = true;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      ref.read(authErrorProvider.notifier).setError("Failed to send reset email. Please try again.");
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.onBackground),
              onPressed: () => context.pop(),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    Text("Reset Password", style: AppTextStyles.h1),
                    const SizedBox(height: 8),
                    Text("Enter your email and we'll send a reset link.", style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText)),
                    const SizedBox(height: 32),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _isSent
                          ? Column(
                              key: const ValueKey('success'),
                              children: [
                                AppCard(
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.check_circle, color: AppColors.success, size: 24),
                                          const SizedBox(width: 8),
                                          Text("Check your email", style: AppTextStyles.h3),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "A reset link has been sent to ${_emailController.text}",
                                        style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),
                                TextButton(
                                  onPressed: () => context.go('/login'),
                                  child: Text("Back to Sign In", style: AppTextStyles.bodyLg.copyWith(color: AppColors.accent)),
                                ),
                              ],
                            )
                          : Column(
                              key: const ValueKey('form'),
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AuthTextField(
                                  label: "Email",
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                ),
                                const SizedBox(height: 24),
                                const AuthErrorBanner(),
                                const SizedBox(height: 16),
                                AuthPrimaryButton(
                                  label: "Send Reset Link",
                                  onPressed: _handleReset,
                                  isLoading: _isLoading,
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
