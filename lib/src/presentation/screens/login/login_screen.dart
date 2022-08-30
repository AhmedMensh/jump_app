import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpapp/src/presentation/screens/home/home_screen.dart';
import 'package:jumpapp/src/presentation/screens/login/bloc/login_cubit.dart';
import 'package:jumpapp/src/presentation/widgets/custome_elevated_button.dart';
import 'package:jumpapp/src/presentation/widgets/custome_text_field.dart';
import 'package:jumpapp/src/presentation/widgets/snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginCubit _loginCubit;

  @override
  void initState() {
    _loginCubit = BlocProvider.of<LoginCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                hint: 'Email',
                controller: _loginCubit.emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: 'Password',
                controller: _loginCubit.passwordController,
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 50),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (_, state) {
              if (state is LoginLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is LoginError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showSnackBar(context, state.error ?? "", color: Colors.red);
                });
              }
              if (state is LoginSuccess) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                      (_) => false);
                });
              }
              return CustomButton(
                label: 'Login',
                borderRadius: 12,
                action: () {
                  _loginCubit.login(_loginCubit.emailController.text,
                      _loginCubit.passwordController.text);
                },
              );
            },
          )),
    );
  }
}
