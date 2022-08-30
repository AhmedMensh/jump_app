import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:jumpapp/src/domain/repositories/user_repository.dart';

part 'login_status_state.dart';

class LoginStatusCubit extends Cubit<LoginStatusState> {
  final UserRepository _userRepository;



  LoginStatusCubit(this._userRepository) : super(const LoginStatusInitial());

  void getLoginStatus() {
    var status = _userRepository.isLoggedIn();
    emit(LoginStatusDone(status));
  }
}
