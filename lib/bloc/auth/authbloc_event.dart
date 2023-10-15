part of 'authbloc_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthRequest extends AuthEvent {
  final String userName;
  final String password;

  const AuthRequest(this.userName, this.password);
}
