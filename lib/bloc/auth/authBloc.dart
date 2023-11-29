import 'package:flutter_bank/bloc/auth/authEvent.dart';
import 'package:flutter_bank/bloc/auth/authState.dart';
import 'package:flutter_bank/models/signIn/signInFormModel.dart';
import 'package:flutter_bank/models/userModel.dart';
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

      if (event is AuthRegister) {
        try {
          emit(AuthLoading());

          final user = await AuthService().register(event.data);
          //jika berhasil
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(
            e.toString(),
          ));
        }
      }

      //for Login
      if (event is AuthLogin) {
        try {
          emit(AuthLoading());

          final user = await AuthService().login(event.data);
          //jika berhasil
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(
            e.toString(),
          ));
        }
      }

      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());
          final SignInFormModel data =
              await AuthService().getCredentialFromLocal();
          final UserModel user = await AuthService().login(data);

          //jika berhasil
          emit(AuthSuccess(user));
        } catch (e) {
          emit(
            AuthFailed(e.toString()),
          );
        }
      }
    });
  }
}
