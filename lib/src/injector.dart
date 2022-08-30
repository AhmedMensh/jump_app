
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jumpapp/src/data/remote/api_services.dart';
import 'package:jumpapp/src/data/remote/dio_clinte.dart';
import 'package:jumpapp/src/data/repositories/stories_repository_imp.dart';
import 'package:jumpapp/src/domain/repositories/stories_repository.dart';
import 'package:jumpapp/src/presentation/screens/home/bloc/stories_cubit.dart';


final locator = GetIt.instance;

Future<void> injectDependencies() async {

  //Data Sources Initialization
  locator.registerSingleton<Dio>(DioClient().create());
  locator.registerSingleton<ApiService>(ApiService(locator()));



  //Repositories Initialization
  locator.registerSingleton<StoriesRepository>(StoriesRepositoryImp(locator()));


  //Blocs Initialization
  locator.registerFactory<StoriesCubit>(() => StoriesCubit(locator()));

}
