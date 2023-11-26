import 'package:flutter_bank/bloc/auth/authEvent.dart';
import 'package:flutter_bank/bloc/auth/authState.dart';
import 'package:flutter_bank/services/authService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());

          final res = await AuthService().checkEmail(event.email);

          //apakahEmail tidak tersedia?
          if (res == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed(
                'Email Sudah Terpakai, Silakan Ganti Yang Lain'));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
