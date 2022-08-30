import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpapp/src/config/size_config/size_config.dart';
import 'package:jumpapp/src/presentation/screens/home/home_screen.dart';
import 'package:jumpapp/src/presentation/screens/login/login_screen.dart';
import 'package:jumpapp/src/presentation/screens/splash/bloc/login_status_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late LoginStatusCubit _loginStatusCubit;

  @override
  void initState() {
    _loginStatusCubit = BlocProvider.of<LoginStatusCubit>(context);
    _loginStatusCubit.getLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:
          BlocBuilder<LoginStatusCubit, LoginStatusState>(builder: (_, state) {
        if (state is LoginStatusDone) {
          Future.delayed(
              const Duration(seconds: 3),
              () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => state.isLogged ?? false
                          ? const HomeScreen()
                          : const LoginScreen()),
                  (_) => false));
        }
        return const SizedBox();
      }),
    );
  }
}
