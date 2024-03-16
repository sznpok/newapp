import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:newsapp/constant/constant.dart';
import 'package:newsapp/pages/auth_page/bloc/register_bloc/user_register_bloc.dart';
import 'package:newsapp/pages/splash_screen.dart';

import 'pages/auth_page/bloc/login_bloc/user_login_bloc.dart';
import 'pages/home_pages/bloc/news_bloc/news_bloc.dart';
import 'pages/home_pages/model/new_model.dart';
import 'utils/size.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.initFlutter();
  Hive.registerAdapter(NewsModelAdapter());
  Hive.registerAdapter(ArticlesAdapter());
  Hive.registerAdapter(SourceAdapter());
  Hive.openBox<NewsModel>("news");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsBloc(),
        ),
        BlocProvider(
          create: (context) => UserLoginBloc(),
        ),
        BlocProvider(create: (context) => UserRegisterBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            foregroundColor: secondaryColor,
            backgroundColor: primaryColor,
            titleTextStyle:
                Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: secondaryColor,
                    ),
          ),
          primaryColor: primaryColor,
          textTheme: Theme.of(context).textTheme,
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
