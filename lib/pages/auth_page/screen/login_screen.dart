import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/pages/auth_page/screen/register_screen.dart';

import '../../../constant/constant.dart';
import '../../../constant/images.dart';
import '../../../utils/size.dart';
import '../../home_pages/screen/home_screen.dart';
import '../services/firebase_auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _authService = FirebaseAuthService();
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
                child: Text(
                  "Login Here",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                alignment: Alignment.center,
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
                decoration: InputDecoration(
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
              TextButton(
                onPressed: () {
                  _login();
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
                            builder: (context) => const RegisterScreen()));
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

  void _login() async {
    //  String username = _userNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _authService.signUser(email, password);

    if (user != null) {
      log("user is successfully created");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Login successfully',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please check your email and password!!!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
      log("not login");
    }
  }
}
