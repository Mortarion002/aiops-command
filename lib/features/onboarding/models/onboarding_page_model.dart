import 'package:flutter/material.dart';
import '../widgets/onboarding_illustrations/illustration_realtime.dart';
import '../widgets/onboarding_illustrations/illustration_insights.dart';
import '../widgets/onboarding_illustrations/illustration_activity.dart';
import '../widgets/onboarding_illustrations/illustration_secure.dart';

class OnboardingPageModel {
  final String title;
  final String subtitle;
  final Widget Function() buildIllustration;

  OnboardingPageModel({
    required this.title,
    required this.subtitle,
    required this.buildIllustration,
  });
}

final List<OnboardingPageModel> onboardingPages = [
  OnboardingPageModel(
    title: 'Real-time AI Operations',
    subtitle: 'Monitor requests, latency, errors, and system health in real time.',
    buildIllustration: () => const IllustrationRealtime(),
  ),
  OnboardingPageModel(
    title: 'Intelligent Insights',
    subtitle: 'Get AI-driven insights and recommendations to optimize performance.',
    buildIllustration: () => const IllustrationInsights(),
  ),
  OnboardingPageModel(
    title: 'Track Every Interaction',
    subtitle: 'Analyze activity logs, model usage, and system behavior.',
    buildIllustration: () => const IllustrationActivity(),
  ),
  OnboardingPageModel(
    title: 'Secure & In Control',
    subtitle: 'Manage API keys, preferences, and billing securely.',
    buildIllustration: () => const IllustrationSecure(),
  ),
];
