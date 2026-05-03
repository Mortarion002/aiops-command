import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_error_banner.dart';
import '../widgets/auth_primary_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ref.read(authErrorProvider.notifier).setError("Email and password are required");
      return;
    }

    setState(() => _isLoading = true);
    ref.read(authErrorProvider.notifier).clear();

    try {
      await ref.read(authProvider.notifier).signInWithEmail(email, password);
      // Router will handle navigation
    } catch (e) {
      if (!mounted) return;
      ref.read(authErrorProvider.notifier).setError(_mapAuthError(e.toString()));
      setState(() => _isLoading = false);
    }
  }

  String _mapAuthError(String error) {
    if (error.contains('wrong-password') || error.contains('invalid-credential')) {
      return "Incorrect password or email. Please try again.";
    }
    if (error.contains('user-not-found')) return "No account found with this email.";
    if (error.contains('invalid-email')) return "Please enter a valid email address.";
    return "Something went wrong. Please try again.";
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
              Text("Welcome back", style: AppTextStyles.h1),
              const SizedBox(height: 8),
              Text("Sign in to continue", style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText)),
              const SizedBox(height: 32),
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
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.push('/forgot-password'),
                  child: Text("Forgot password?", style: AppTextStyles.bodyMd.copyWith(color: AppColors.onBackground)),
                ),
              ),
              const SizedBox(height: 24),
              const AuthErrorBanner(),
              const SizedBox(height: 16),
              AuthPrimaryButton(
                label: "Sign In",
                onPressed: _handleSignIn,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 32),
              Center(
                child: GestureDetector(
                  onTap: () => context.push('/signup'),
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account?  ",
                      style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText),
                      children: [
                        TextSpan(
                          text: "Sign up",
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
