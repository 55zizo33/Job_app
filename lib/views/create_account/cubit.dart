import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_app/views/create_account/Repository.dart';
import 'package:jobs_app/views/create_account/states.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final UserRepository _userRepository;

  RegisterCubit(this._userRepository) : super(RegisterInitial());

  Future<void> register(String username, String email, String password) async {
    emit(RegisterLoading());

    try {
      final data = await _userRepository.createAccountUser(username, email, password);

      if (data['status'] == true) {
        emit(RegisterSuccess(data['data']));
      } else {
        emit(RegisterFailure('Registration failed: ${data['message']}'));
      }
    } catch (error) {
      emit(RegisterFailure('Registration failed: $error'));
    }
  }
}
