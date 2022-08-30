import 'package:jumpapp/src/core/constants.dart';
import 'package:jumpapp/src/data/data_sources/preferences/preferences_storage.dart';
import 'package:jumpapp/src/domain/repositories/user_repository.dart';

class UserRepositoryImp extends UserRepository{
  final PreferencesStorage _preferencesStorage;

  UserRepositoryImp(this._preferencesStorage);
  @override
  bool isLoggedIn() {
   return _preferencesStorage.getBool(kIsLoggedIn) ?? false;
  }

  @override
  Future<void> setLoggedInState(bool isLogged) async{
    await _preferencesStorage.setBool(kIsLoggedIn, isLogged);
  }
}