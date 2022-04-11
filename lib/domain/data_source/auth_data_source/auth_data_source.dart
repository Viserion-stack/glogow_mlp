import 'package:glogow_mlp/domain/model/user.dart';

abstract class AuthRepository {
  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String email,
    required String name,
    required String password,
  });

  Future<void> signOut();

  Future<void> signInAnonymously();
}
