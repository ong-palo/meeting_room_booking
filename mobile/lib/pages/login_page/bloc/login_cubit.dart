import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meeting_room_booking/pages/login_page/bloc/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Dio dio = Dio();

  void setEmail(String email) {
    emit(state.copyWith(
      email: email,
    ));
  }

  void setPassword(String password) {
    emit(state.copyWith(
      password: password,
    ));
  }

  Future<void> login() async {
    try {} on DioException catch (e) {}
  }
}
