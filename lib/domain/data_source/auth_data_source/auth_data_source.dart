import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glogow_mlp/domain/model/user.dart';

class AuthRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AuthRepository({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  Future<void> signIn({required String email, required String password}) async {
    FirebaseAuth auth = firebaseAuth;

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

  Future<void> signInAnonymously() async {
    FirebaseAuth auth = firebaseAuth;
    await auth.signInAnonymously();
  }

  Future<void> signOut() async {
    FirebaseAuth auth = firebaseAuth;
    await auth.signOut();
  }

  Future<void> signUp(
      {required String email,
      required String name,
      required String password}) async {
    FirebaseAuth auth = firebaseAuth;

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
