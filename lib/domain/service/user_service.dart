import 'package:glogow_mlp/domain/data_source/auth_data_source/auth_data_source.dart';
import 'package:glogow_mlp/domain/model/user.dart';

class UserService {
  final AuthRepository authRepository;

  UserService(this.authRepository);

  Future<void> signIn({
    required String email,
    required String password,
  }) {
    return authRepository.signIn(email: email, password: password);
  }

  Future<void> signUp({
    required String email,
    required String name,
    required String password,
  }) {
    return authRepository.signUp(email: email, name: name, password: password);
  }

  Future<void> signOut() {
    return authRepository.signOut();
  }

  Future<void> signInAnonymously() {
    return authRepository.signInAnonymously();
  }
}
