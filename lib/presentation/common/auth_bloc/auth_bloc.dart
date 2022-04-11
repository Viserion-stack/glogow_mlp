import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glogow_mlp/domain/model/user.dart' as user;
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:glogow_mlp/domain/service/user_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserService userService;
  AuthBloc({required this.userService}) : super(AuthState.initial()) {
    on<AuthEvent>((event, emit) {});
    on<SignoutRequestedEvent>(
      (event, emit) async {
        await userService.signOut();
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
        await userService.signIn(
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
        await userService.signUp(
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
        await userService.signInAnonymously();
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
