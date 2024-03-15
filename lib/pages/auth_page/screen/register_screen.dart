import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/pages/auth_page/screen/login_screen.dart';

import '../../../constant/constant.dart';
import '../../../constant/images.dart';
import '../../../utils/size.dart';
import '../../home_pages/screen/home_screen.dart';
import '../services/firebase_auth_services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  "Register Here",
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
              TextButton(
                onPressed: () {
                  _register();
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
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _authService.registerUser(email, password);
    if (user != null) {
      log("user is successfullly created");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'User registered successfully',
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
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    } else {
      log("not registered");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'User already registered',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
