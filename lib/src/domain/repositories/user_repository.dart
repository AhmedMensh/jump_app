abstract class UserRepository {
  bool isLoggedIn();
  Future<void> setLoggedInState(bool isLogged);
}
