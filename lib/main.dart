// ignore_for_file: prefer_const_constructors

import 'package:bwa_airplane/ui/pages/get_started_page.dart';
import 'package:bwa_airplane/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplashPage(),
        "/get-started": (context) => GetStartedPage(),
      },
    );
  }
}
