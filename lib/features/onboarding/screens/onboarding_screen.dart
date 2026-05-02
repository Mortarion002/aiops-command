import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../models/onboarding_page_model.dart';
import '../providers/onboarding_provider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: ref.read(onboardingNotifierProvider));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    final currentIndex = ref.read(onboardingNotifierProvider);
    if (currentIndex < 3) {
      ref.read(onboardingNotifierProvider.notifier).nextPage();
      _pageController.animateToPage(
        currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/login');
    }
  }

  void _onSkip() {
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(onboardingNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _onSkip,
                child: Text('Skip', style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText)),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(), // user must use buttons
                itemCount: onboardingPages.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: onboardingPages[index].buildIllustration(),
                        ),
                      ),
                      const SizedBox(height: 48),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return SlideTransition(
                            position: Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(animation),
                            child: FadeTransition(opacity: animation, child: child),
                          );
                        },
                        child: Column(
                          key: ValueKey<int>(index),
                          children: [
                            Text(
                              onboardingPages[index].title,
                              style: AppTextStyles.h1,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32),
                              child: Text(
                                onboardingPages[index].subtitle,
                                style: AppTextStyles.bodyLg.copyWith(color: AppColors.mutedText),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(4, (index) {
                      final isActive = index == currentIndex;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.only(right: 8),
                        width: isActive ? 20 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: isActive ? AppColors.primary : const Color(0xFF444748),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      );
                    }),
                  ),
                  ElevatedButton(
                    onPressed: _onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentIndex == 3 ? const Color(0xFF0D1B3E) : const Color(0xFF1C1B1B),
                      foregroundColor: AppColors.primary,
                      shape: const StadiumBorder(),
                      minimumSize: const Size(140, 52),
                      elevation: 0,
                      side: currentIndex < 3 ? const BorderSide(color: AppColors.outline) : BorderSide.none,
                    ),
                    child: Text(currentIndex == 3 ? 'Get Started' : 'Next', style: AppTextStyles.bodyLg.copyWith(fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
