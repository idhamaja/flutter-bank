import 'package:equatable/equatable.dart';
import 'package:flutter_bank/models/editProfile/userEditFormModels.dart';
import 'package:flutter_bank/models/signIn/signInFormModel.dart';
import 'package:flutter_bank/models/signUp/signUpFormModel.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent {
  final String email;
  const AuthCheckEmail(this.email);

  @override
  List<Object> get props => [email];
}

class AuthRegister extends AuthEvent {
  final SignUpFormModel data;
  const AuthRegister(this.data);

  @override
  List<Object> get props => [data];
}

//event for Login
class AuthLogin extends AuthEvent {
  final SignInFormModel data;
  const AuthLogin(this.data);

  @override
  List<Object> get props => [data];
}

class AuthGetCurrentUser extends AuthEvent {}

class AuthUpdateUser extends AuthEvent {
  final UserEditFormModels data;
  const AuthUpdateUser(this.data);

  @override
  List<Object> get props => [data];
}

class AuthPinUpdate extends AuthEvent {
  final String oldPin;
  final String newPin;

  const AuthPinUpdate(
    this.oldPin,
    this.newPin,
  );

  @override
  List<Object> get props => [
        oldPin,
        newPin,
      ];
}

class AuthLogout extends AuthEvent {}
