
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpapp/src/injector.dart';
import 'package:jumpapp/src/presentation/screens/home/bloc/stories_cubit.dart';
import 'package:jumpapp/src/presentation/screens/login/bloc/login_cubit.dart';

import '../presentation/screens/splash/bloc/login_status_cubit.dart';


List<BlocProvider> getAppBlocs() {
  return [

    BlocProvider<StoriesCubit>(create: (context) => locator()),
    BlocProvider<LoginStatusCubit>(create: (context) => locator()),
    BlocProvider<LoginCubit>(create: (context) => locator()),
  ];
}
