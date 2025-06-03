import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/auth_model.dart';
import '../../data/repository/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginRequestEvent>(_onLoginRequest);
  }

  Future<void> _onLoginRequest(
    LoginRequestEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final AuthModel authModel = await authRepository.login(
        event.email,
        event.password,
      );
      emit(AuthSuccess(token: authModel.token));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }
}
