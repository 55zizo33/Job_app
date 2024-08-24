import 'package:bloc/bloc.dart';
import 'package:jobs_app/cubit/Auth/AuthRepository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());

      // استخدام AuthRepository لتسجيل الدخول
      final result = await authRepository.login(email, password);

      // بعد نجاح تسجيل الدخول
      emit(AuthLoginSuccess());
    } catch (e) {
      emit(AuthLoginFailure(e.toString()));
    }
  }

  Future<void> register(String email, String password) async {
    try {
      emit(AuthLoading());

      // استخدام AuthRepository للتسجيل
      final result = await authRepository.register(email, password);

      // بعد نجاح التسجيل
      emit(AuthRegisterSuccess());
    } catch (e) {
      emit(AuthRegisterFailure(e.toString()));
    }
  }
}
