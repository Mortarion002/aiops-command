import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_error_banner.dart';
import '../widgets/auth_primary_button.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirm = _confirmPasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ref.read(authErrorProvider.notifier).setError("All fields are required");
      return;
    }
    
    if (password.length < 8) {
      ref.read(authErrorProvider.notifier).setError("Password must be at least 8 characters");
      return;
    }

    if (password != confirm) {
      ref.read(authErrorProvider.notifier).setError("Passwords do not match");
      return;
    }

    setState(() => _isLoading = true);
    ref.read(authErrorProvider.notifier).clear();

    try {
      await ref.read(authProvider.notifier).signUpWithEmail(email, password, name);
      // Router will handle navigation
    } catch (e) {
      ref.read(authErrorProvider.notifier).setError("Failed to create account. Please try again.");
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Row(
                children: [
                  const Icon(Icons.terminal, size: 20, color: AppColors.primary),
                  const SizedBox(width: 8),
                  Text("AIOps Command", style: AppTextStyles.h3),
                ],
              ),
              const SizedBox(height: 48),
              Text("Create account", style: AppTextStyles.h1),
              const SizedBox(height: 8),
              Text("Start monitoring your AI operations", style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText)),
              const SizedBox(height: 32),
              AuthTextField(
                label: "Full Name",
                controller: _nameController,
              ),
              const SizedBox(height: 16),
              AuthTextField(
                label: "Email",
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ),
              const SizedBox(height: 16),
              AuthTextField(
                label: "Password",
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 16),
              AuthTextField(
                label: "Confirm Password",
                obscureText: true,
                controller: _confirmPasswordController,
              ),
              const SizedBox(height: 24),
              const AuthErrorBanner(),
              const SizedBox(height: 16),
              AuthPrimaryButton(
                label: "Create Account",
                onPressed: _handleSignup,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 32),
              Center(
                child: GestureDetector(
                  onTap: () => context.go('/login'),
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account?  ",
                      style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText),
                      children: [
                        TextSpan(
                          text: "Sign in",
                          style: AppTextStyles.bodyMd.copyWith(color: AppColors.accent, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
