import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../constant/images.dart';
import '../../../utils/size.dart';
import '../../home_pages/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final FirebaseAuthService _authService = FirebaseAuthService();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
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
            const Text('Username'),
            TextFormField(
              controller: _userNameController,
              decoration: InputDecoration(
                hintText: "username",
                border: OutlineInputBorder(),
              ),
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
                // _login();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
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
            ),
          ],
        ),
      ),
    );
  }

/* void _register() async {
    String username = _userNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _authService.registerUser(email, password);

    if (user != null) {
      log("user is successfullly created");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    } else {
      log("not registered");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'User already registered',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }*/

/* void _login() async {
    //  String username = _userNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _authService.signUser(email, password);

    if (user != null) {
      log("user is successfully created");
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
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
      log("not login");
    }
  }*/
}
