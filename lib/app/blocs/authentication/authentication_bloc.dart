import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialAuthenticationState()) {
    on<OnAuthCheck>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(AuthenticationFail());
    });
    on<OnAuthProcess>((event, emit) => emit(AuthenticationSuccess()));
    on<OnClear>((event, emit) => emit(AuthenticationFail()));
  }
}
