import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/pages/auth_page/bloc/user_kyc_bloc/user_kyc_bloc.dart';
import 'package:newsapp/pages/auth_page/screen/login_screen.dart';
import 'package:newsapp/pages/auth_page/screen/register_screen.dart';

import '../../../constant/constant.dart';
import '../../../utils/size.dart';

class UserKycScreen extends StatefulWidget {
  const UserKycScreen({super.key});

  @override
  State<UserKycScreen> createState() => _UserKycScreen();
}

class _UserKycScreen extends State<UserKycScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _citizenNumberController =
      TextEditingController();

  DatabaseReference? dbRef;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _fatherNameController.dispose();
    _motherNameController.dispose();
    _citizenNumberController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('KYC'),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          SizeConfig.padding! * 0.03,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "KYC Setup",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.05,
                ),
                const Text('Full Name'),
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: "enter your name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.02,
                ),
                const Text('Fathers Name'),
                TextFormField(
                  controller: _fatherNameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: "enter your father name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your father name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.02,
                ),
                const Text('Mothers Name'),
                TextFormField(
                  controller: _motherNameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: "enter your mother name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter mother name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.02,
                ),
                const Text('Age'),
                TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "enter your age",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your age';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.02,
                ),
                const Text('Citizenship No.'),
                TextFormField(
                  controller: _citizenNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "enter your citizenship number",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your citizenship Number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.02,
                ),
                BlocListener<UserKycBloc, UserKycState>(
                  listener: (context, state) {
                    if (state is LoadingUserKycState) {
                      const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ErrorUserKycState) {
                      log("error state");
                      Text(state.runtimeType.toString());
                    } else if (state is SuccessUserKycState) {
                      log("success state");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    }
                  },
                  child: TextButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Enter Your all details',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                      context.read<UserKycBloc>().add(
                            RegisterKycEvent(
                                int.parse(_citizenNumberController.text),
                                int.parse(_ageController.text),
                                _motherNameController.text,
                                _fatherNameController.text,
                                _nameController.text),
                          );
                      // _kycSetup();
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      foregroundColor: secondaryColor,
                      backgroundColor: primaryColor,
                      fixedSize: Size(
                        SizeConfig.screenWidth!,
                        SizeConfig.screenHeight! * 0.07,
                      ),
                    ),
                    child: Text(
                      'Set up',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
