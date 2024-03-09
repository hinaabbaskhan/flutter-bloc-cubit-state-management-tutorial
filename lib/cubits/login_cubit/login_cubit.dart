import 'package:bloc/bloc.dart';
import 'package:bloc_state_management_tutorial/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(String email, String password) async {
    try {
      emit(LoginLoading());
      final loginModel = await AuthRepository().login(email, password);
      if (loginModel != null && loginModel.token != null) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure());
      }
    } catch (e) {
      emit(LoginFailure());
    }
  }
}
