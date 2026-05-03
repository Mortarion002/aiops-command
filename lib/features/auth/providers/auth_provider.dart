import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/user_repository.dart';
import '../models/app_user.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Stream<User?> build() => FirebaseAuth.instance.authStateChanges();

  Future<void> signInWithEmail(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUpWithEmail(String email, String password, String name) async {
    final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    await cred.user?.updateDisplayName(name);
    
    if (cred.user != null) {
      final newUser = AppUser(
        id: cred.user!.uid,
        email: email,
        name: name,
      );
      await ref.read(userRepositoryProvider).createUser(newUser);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

@riverpod
class AuthErrorNotifier extends _$AuthErrorNotifier {
  @override
  String? build() => null;
  
  void setError(String? message) => state = message;
  void clear() => state = null;
}

