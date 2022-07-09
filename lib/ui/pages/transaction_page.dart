// ignore_for_file: prefer_const_constructors

import 'package:bwa_airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Text(
          'Transaction Page',
        ),
      ),
    );
  }
}
