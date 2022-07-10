// ignore_for_file: prefer_const_constructors

import 'package:bookflights/cubit/auth_cubit.dart';
import 'package:bookflights/cubit/page_cubit.dart';
import 'package:bookflights/ui/pages/bonus_page.dart';
import 'package:bookflights/ui/pages/get_started_page.dart';
import 'package:bookflights/ui/pages/main_page.dart';
import 'package:bookflights/ui/pages/signup_page.dart';
import 'package:bookflights/ui/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplashPage(),
          "/get-started": (context) => GetStartedPage(),
          "/sign-up": (context) => SignUpPage(),
          "/bonus": (context) => BonusPage(),
          "/main": (context) => MainPage(),
        },
      ),
    );
  }
}
