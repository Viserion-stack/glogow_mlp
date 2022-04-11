import 'package:firebase_auth/firebase_auth.dart';
import 'package:glogow_mlp/domain/data_source/auth_data_source/auth_data_source.dart';

class AuthRemoteDataSource implements AuthRepository {
  @override
  Future<void> signIn({required String email, required String password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print('Firebase ERROR ${e.toString()}');
    } catch (e) {
      print('SignIn ERROR');
    }
  }

  @override
  Future<void> signInAnonymously() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signInAnonymously();
  }

  @override
  Future<void> signOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
  }

  @override
  Future<void> signUp(
      {required String email,
      required String name,
      required String password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print('Firebase ERROR ${e.toString()}');
    } catch (e) {
      print('SignOut ERROR');
    }
  }
}
