import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/pages/auth_page/bloc/user_kyc_bloc/user_kyc_bloc.dart';
import 'package:newsapp/pages/auth_page/screen/user_kyc_screen.dart';
import '/pages/auth_page/bloc/login_bloc/user_login_bloc.dart';
import '/pages/auth_page/screen/register_screen.dart';
import '../../../constant/constant.dart';
import '../../../utils/size.dart';
import '../../home_pages/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Setup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          SizeConfig.padding! * 0.03,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Login Here",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              const Text('Email'),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: "email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              Text('Password'),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: "password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              BlocListener<UserLoginBloc, UserLoginState>(
                listener: (context, state) {
                  if (state is LoadingUserLoginState) {
                    const Center(child: CircularProgressIndicator.adaptive());
                  } else if (state is ErrorUserLoginState) {
                    log(state.runtimeType.toString());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Please check your email and password",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else if (state is SuccessUserLoginState) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                        (route) => false);
                  }
                },
                child: TextButton(
                  onPressed: () {
                    BlocProvider.of<UserLoginBloc>(context).add(
                      LoginEvent(
                          email: _emailController.text,
                          password: _passwordController.text),
                    );
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    foregroundColor: secondaryColor,
                    backgroundColor: primaryColor,
                    fixedSize: Size(
                      SizeConfig.screenWidth!,
                      SizeConfig.screenHeight! * 0.08,
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'If not registered, please registered here ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.01,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserKycScreen()));
                  },
                  child: Text(
                    'Sign up',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
