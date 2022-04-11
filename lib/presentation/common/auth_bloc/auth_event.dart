part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStateChangedEvent extends AuthEvent {
  final fbAuth.User? user;
  const AuthStateChangedEvent({
    this.user,
  });
  @override
  List<Object> get props => [user!];
}

class SignoutRequestedEvent extends AuthEvent {}

class SignInRequestedEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInRequestedEvent({
    required this.email,
    required this.password,
  });
}

class SignInAnonimouslyRequestedEvent extends AuthEvent {}

class SignUpRequestedEvent extends AuthEvent {
  final String name;
  final String password;
  final String email;

  const SignUpRequestedEvent({
    required this.name,
    required this.password,
    required this.email,
  });
}
