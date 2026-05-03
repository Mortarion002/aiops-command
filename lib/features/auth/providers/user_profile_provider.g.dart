// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentUserProfile)
final currentUserProfileProvider = CurrentUserProfileProvider._();

final class CurrentUserProfileProvider
    extends
        $FunctionalProvider<AsyncValue<AppUser?>, AppUser?, FutureOr<AppUser?>>
    with $FutureModifier<AppUser?>, $FutureProvider<AppUser?> {
  CurrentUserProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserProfileProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserProfileHash();

  @$internal
  @override
  $FutureProviderElement<AppUser?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AppUser?> create(Ref ref) {
    return currentUserProfile(ref);
  }
}

String _$currentUserProfileHash() =>
    r'dd9e1a4b81afc8a323d8d0b3b6bca2eb651f2265';
