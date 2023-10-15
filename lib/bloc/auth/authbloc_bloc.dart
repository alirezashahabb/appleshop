import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/repositroy/auth_repositroy.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'authbloc_event.dart';
part 'authbloc_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepositroy authrepostiry = locator.get();
  AuthBloc() : super(AuthblocInitial()) {
    on<AuthRequest>((event, emit) async {
      emit(AuthLoading());
      var responce = await authrepostiry.login(event.userName, event.password);
      emit(AuthResonse(responce));
    });
  }
}
