# AIOps Command Improvement Plan

This file tracks the planned Version2 cleanup work. Each phase should stay small, pass verification, and be pushed before the next phase starts.

## Phase 1 - Auth and Router Safety

Goal: remove lifecycle bugs that can cause odd navigation, duplicate auth subscriptions, or async state crashes.

Planned changes:
- Rework the GoRouter provider so it listens to the Riverpod auth stream through provider state instead of calling `build()` manually.
- Dispose router refresh listeners through the provider lifecycle.
- Add mounted checks around async auth UI flows before calling `setState`, navigation, or snackbars.
- Keep sign-in, sign-up, reset, and sign-out behavior unchanged from a user point of view.

Verification:
- Run `flutter analyze`.
- Run any available Flutter tests.
- Manually inspect touched auth/router code paths.

## Phase 2 - Scroll and Refresh Smoothness

Goal: reduce layout work and visible jitter in high-traffic screens.

Planned changes:
- Replace nested `SingleChildScrollView` plus `ListView.shrinkWrap` in Activity Logs with a single lazily built scrollable list.
- Avoid unnecessary `GridView.shrinkWrap` layout work for the four KPI cards.
- Make pull-to-refresh wait for provider reloads instead of ending immediately.
- Use route navigation patterns that match bottom-tab behavior and avoid stacking duplicate tab pages.

Verification:
- Run `flutter analyze`.
- Run any available Flutter tests.
- Check Activity, Dashboard, Insights, and bottom navigation flows.

## Phase 3 - Analyzer and Polish Cleanup

Goal: reduce warning noise and remove small quality issues that hide real problems.

Planned changes:
- Remove unused imports, unused fields, and unused constructor parameters reported by the analyzer.
- Replace deprecated `withOpacity` and `activeColor` usage with current Flutter APIs.
- Clean corrupted visible strings in app screens where they affect UI output.
- Keep unrelated README content untouched unless requested separately.

Verification:
- Run `flutter analyze` and aim for zero issues.
- Run any available Flutter tests.
- Review `git diff` before final push.

## Notes

- The repository currently has no `*_test.dart` files, so `flutter test` may report that there are no tests to run until tests are added.
- Push after every completed phase to preserve a clear branch history.
