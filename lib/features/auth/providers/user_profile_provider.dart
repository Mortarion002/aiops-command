import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/app_user.dart';
import '../repositories/user_repository.dart';
import 'auth_provider.dart';

part 'user_profile_provider.g.dart';

@riverpod
Future<AppUser?> currentUserProfile(CurrentUserProfileRef ref) async {
  final user = ref.watch(authProvider).value;
  if (user == null) return null;
  return ref.read(userRepositoryProvider).getUser(user.uid);
}
