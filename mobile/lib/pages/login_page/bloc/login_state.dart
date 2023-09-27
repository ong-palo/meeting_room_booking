import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String? email;
  final String? password;
  final bool? passwordVisible;

  const LoginState({this.email, this.password, this.passwordVisible = false});

  LoginState copyWith({
    String? email,
    String? password,
    bool? passwordVisible,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      passwordVisible: passwordVisible ?? this.passwordVisible,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        passwordVisible,
      ];
}
