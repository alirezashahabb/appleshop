part of 'auth_bloc_bloc.dart';

class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginRequestEvent extends AuthBlocEvent {
  final String userName;
  final String password;

  const AuthLoginRequestEvent({required this.userName, required this.password});

  @override
  // TODO: implement props
  List<Object> get props => [userName, password];
}
