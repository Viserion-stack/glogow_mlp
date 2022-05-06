// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glogow_mlp/domain/data_source/auth_data_source/auth_data_source.dart';
// ignore: library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthState.initial()) {
    on<AuthEvent>((event, emit) {});
    on<SignoutRequestedEvent>(
      (event, emit) async {
        await authRepository.signOut();
        emit(
          state.copyWith(
            authStatus: AuthStatus.unauthenticated,
            user: null,
          ),
        );
      },
    );
    on<SignInRequestedEvent>(
      (event, emit) async {
        var user;
        await authRepository.signIn(
          email: event.email,
          password: event.password,
        );
        user = user.User(
          email: FirebaseAuth.instance.currentUser!.email,
          name: FirebaseAuth.instance.currentUser!.displayName,
          profileImage: FirebaseAuth.instance.currentUser!.photoURL,
        );
        emit(
          state.copyWith(
            authStatus: AuthStatus.authenticated,
            user: user,
          ),
        );
      },
    );
    on<SignUpRequestedEvent>(
      (event, emit) async {
        var user;
        await authRepository.signUp(
          email: event.email,
          password: event.password,
          name: event.name,
        );
        user = user.User(
          email: FirebaseAuth.instance.currentUser!.email,
          name: FirebaseAuth.instance.currentUser!.displayName,
          profileImage: FirebaseAuth.instance.currentUser!.photoURL,
        );
        emit(
          state.copyWith(
            authStatus: AuthStatus.authenticated,
            user: user,
          ),
        );
      },
    );
    on<SignInAnonimouslyRequestedEvent>(
      (event, emit) async {
        var user;
        user = user.User.initia();
        await authRepository.signInAnonymously();
        emit(
          state.copyWith(
            authStatus: AuthStatus.authenticated,
            user: user,
          ),
        );
      },
    );
  }
}
