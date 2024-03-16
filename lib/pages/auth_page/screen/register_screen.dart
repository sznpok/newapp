import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/pages/auth_page/bloc/register_bloc/user_register_bloc.dart';
import 'package:newsapp/pages/auth_page/screen/login_screen.dart';

import '../../../constant/constant.dart';

import '../../../utils/size.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register user'),
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
                    "Please enter your email and password to setup",
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
                const Text('Password'),
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
                BlocListener<UserRegisterBloc, UserRegisterState>(
                  listener: (context, state) {
                    if (state is LoadingUserRegisterState) {
                      const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ErrorUserRegisterState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Already registered please go back and login",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else if (state is SuccessUserRegisterState) {
                      SnackBar(
                        content: Text(
                          "Successfully registered",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      );
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (route) => false);
                    }
                  },
                  child: TextButton(
                    onPressed: () {
                      context.read<UserRegisterBloc>().add(RegisterEvent(
                          email: _emailController.text,
                          password: _passwordController.text));
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
                      'Register',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.02,
                ),
                GestureDetector(
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: primaryColor,
                        ),
                  ),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
