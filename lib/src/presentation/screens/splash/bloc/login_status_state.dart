part of 'login_status_cubit.dart';

abstract class LoginStatusState extends Equatable {
  final bool? isLogged;
  const LoginStatusState({this.isLogged});
  @override
  List<Object> get props => [];
}

class LoginStatusInitial extends LoginStatusState {
  const LoginStatusInitial();
}

class LoginStatusDone extends LoginStatusState {
  const LoginStatusDone(bool isLogged) :super(isLogged: isLogged);
}
