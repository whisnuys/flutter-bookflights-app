import 'package:bloc/bloc.dart';
import 'package:bookflights/models/user_model.dart';
import 'package:bookflights/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService()
          .signup(email: email, password: password, name: name);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
