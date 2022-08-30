import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jumpapp/src/domain/repositories/user_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final UserRepository _userRepo;
  LoginCubit(this._userRepo) : super(const LoginInitial());


  Future<void> login(String email, String password) async {
    emit(const LoginLoading());
    await Future.delayed(const Duration(seconds: 2));
    if (_isValidInputs(email, password)) {
      _userRepo.setLoggedInState(true);
      emit(const LoginSuccess());
    }
  }

  bool _isValidInputs(String email, String password) {
    if (email != "admin" && password != "admin") {
      emit(const LoginError(
          "Please make sure you have correct access credentials"));
      return false;
    }
    return true;
  }
}
