part of 'authbloc_bloc.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthblocInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthResonse extends AuthState {
   final Either<String, String> responce;

  const AuthResonse(this.responce);
}
