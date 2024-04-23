import 'package:appleshop1/data/repositroy/auth_repositroy.dart';
import 'package:appleshop1/di/di.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  /// this is field injection authRepository
  final IAuthRepository _authRepository = locator.get();
  AuthBloc() : super(AuthBlocInitialState()) {
    on<AuthBlocEvent>(
      (event, emit) async {
        if (event is AuthLoginRequestEvent) {
          emit(AuthSateLoading());
          var response =
              await _authRepository.login(event.userName, event.password);
          emit(AuthResponseState(response: response));
        }
      },
    );
  }
}
