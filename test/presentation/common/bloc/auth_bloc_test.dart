import 'package:bloc_test/bloc_test.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:glogow_mlp/domain/data_source/auth_data_source/auth_data_source.dart';
import 'package:glogow_mlp/domain/model/user.dart';
import 'package:glogow_mlp/presentation/common/auth_bloc/auth_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
  });

  User? setUser = const User(
    id: '',
    email: '',
    name: '',
    profilImage: '',
  );
  blocTest(
    'On event SignInAnonimouslyRequestedEvent then emit authenticated',
    build: () => AuthBloc(authRepository: mockAuthRepository),
    setUp: () {
      // when(() => mockAuthRepository.signInAnonymously())
      //     .thenReturn();
    },
    act: (AuthBloc bloc) {
      bloc.add(SignInAnonimouslyRequestedEvent());
    },
    expect: () => [
      AuthState.initial().copyWith(
        authStatus: AuthStatus.authenticated,
      )
    ],
  );
}
