import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpapp/src/core/app_blocs.dart';
import 'package:jumpapp/src/injector.dart';
import 'package:jumpapp/src/presentation/screens/home/home_screen.dart';

import 'src/config/routes/app_routes.dart';

void main() async{
  await injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: getAppBlocs(),
        child: MaterialApp(
          title: 'Jump App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const HomeScreen(),
        ));
  }
}
