import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  int build() => 0;

  void nextPage() {
    if (state < 3) state = state + 1;
  }

  void goToPage(int index) => state = index;
}
