part of 'auth_bloc_bloc.dart';

class AuthBlocState extends Equatable {
  const AuthBlocState();

  @override
  List<Object> get props => [];
}

class AuthBlocInitialState extends AuthBlocState {}

class AuthSateLoading extends AuthBlocState {}

class AuthResponseState extends AuthBlocState {
  final Either<String, String> response;

  const AuthResponseState({required this.response});
}
