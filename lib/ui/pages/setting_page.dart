// ignore_for_file: prefer_const_constructors

import 'package:bookflights/shared/theme.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Text(
          'Setting Page',
        ),
      ),
    );
  }
}
