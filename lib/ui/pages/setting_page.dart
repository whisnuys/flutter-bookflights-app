// ignore_for_file: prefer_const_constructors

import 'package:bookflights/cubit/auth_cubit.dart';
import 'package:bookflights/cubit/page_cubit.dart';
import 'package:bookflights/shared/theme.dart';
import 'package:bookflights/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            context.read<PageCubit>().setPage(0);
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: CustomButton(
              title: 'Sign Out',
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
              width: 220,
            ),
          );
        },
      ),
    );
  }
}
