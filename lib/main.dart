import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant/constant.dart';
import 'package:newsapp/pages/splash_screen.dart';

import 'pages/home_pages/bloc/news_bloc.dart';
import 'utils/size.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => NewsBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: secondaryColor),
          primaryColor: primaryColor,
          textTheme: Theme.of(context).textTheme,
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
