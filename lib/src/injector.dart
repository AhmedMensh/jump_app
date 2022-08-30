
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jumpapp/src/data/data_sources/preferences/preferences_storage.dart';
import 'package:jumpapp/src/data/data_sources/remote/api_services.dart';
import 'package:jumpapp/src/data/data_sources/remote/dio_clinte.dart';

import 'package:jumpapp/src/data/repositories/stories_repository_imp.dart';
import 'package:jumpapp/src/domain/repositories/stories_repository.dart';
import 'package:jumpapp/src/presentation/screens/home/bloc/stories_cubit.dart';
import 'package:jumpapp/src/presentation/screens/login/bloc/login_cubit.dart';
import 'package:jumpapp/src/presentation/screens/splash/bloc/login_status_cubit.dart';

import 'data/repositories/user_repository_imp.dart';
import 'domain/repositories/user_repository.dart';



final locator = GetIt.instance;

Future<void> injectDependencies() async {

  //Data Sources Initialization
  locator.registerSingleton<Dio>(DioClient().create());
  locator.registerSingleton<ApiService>(ApiService(locator()));
  locator.registerSingleton<PreferencesStorage>(PreferencesStorage());

  //Repositories Initialization
  locator.registerSingleton<StoriesRepository>(StoriesRepositoryImp(locator()));
  locator.registerSingleton<UserRepository>(UserRepositoryImp(locator()));


  //Blocs Initialization
  locator.registerFactory<StoriesCubit>(() => StoriesCubit(locator()));
  locator.registerFactory<LoginStatusCubit>(() => LoginStatusCubit(locator()));
  locator.registerFactory<LoginCubit>(() => LoginCubit(locator()));

}
