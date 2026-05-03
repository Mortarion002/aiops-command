import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/signup_screen.dart';
import '../../features/auth/screens/forgot_password_screen.dart';
import '../../features/dashboard/screens/dashboard_screen.dart';
import '../../features/activity/screens/activity_screen.dart';
import '../../features/insights/screens/insights_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../shared/widgets/app_scaffold.dart';
import '../../features/auth/providers/auth_provider.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/onboarding',
    redirect: (context, state) {
      final isAuthenticated = authState.value != null;
      final isOnboarding = state.matchedLocation.startsWith('/onboarding');
      final isAuthRoute = ['/login', '/signup', '/forgot-password']
          .contains(state.matchedLocation);

      if (isAuthenticated) {
        if (isAuthRoute || isOnboarding) return '/dashboard';
        return null;
      } else {
        if (!isAuthRoute && !isOnboarding) return '/onboarding';
        return null;
      }
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppScaffold(shell: shell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/dashboard',
              pageBuilder: (context, state) => const CustomTransitionPage(
                child: DashboardScreen(),
                transitionsBuilder: _transitionsBuilder,
              ),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/activity',
              pageBuilder: (context, state) => const CustomTransitionPage(
                child: ActivityScreen(),
                transitionsBuilder: _transitionsBuilder,
              ),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/insights',
              pageBuilder: (context, state) => const CustomTransitionPage(
                child: InsightsScreen(),
                transitionsBuilder: _transitionsBuilder,
              ),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) => const CustomTransitionPage(
                child: SettingsScreen(),
                transitionsBuilder: _transitionsBuilder,
              ),
            ),
          ]),
        ],
      ),
    ],
  );
}

Widget _transitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(
    opacity: animation,
    child: SlideTransition(
      position: Tween<Offset>(begin: const Offset(0, 0.04), end: Offset.zero)
          .animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
      child: child,
    ),
  );
}
