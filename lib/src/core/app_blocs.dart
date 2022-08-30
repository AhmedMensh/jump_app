
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpapp/src/domain/repositories/stories_repository.dart';
import 'package:jumpapp/src/injector.dart';
import 'package:jumpapp/src/presentation/screens/home/bloc/stories_cubit.dart';


List<BlocProvider> getAppBlocs() {
  return [

    BlocProvider<StoriesCubit>(create: (context) => locator()),
  ];
}
