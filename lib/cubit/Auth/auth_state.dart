import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {

}

class AuthLoginFailure extends AuthState {
  final String error;

  const AuthLoginFailure(this.error);

  @override
  List<Object> get props => [error];
}

class AuthRegisterSuccess extends AuthState {

}

class AuthRegisterFailure extends AuthState {
  final String error;

  const AuthRegisterFailure(this.error);

  @override
  List<Object> get props => [error];
}
