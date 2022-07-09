// ignore_for_file: prefer_const_constructors

import 'package:bookflights/cubit/page_cubit.dart';
import 'package:bookflights/ui/pages/setting_page.dart';
import 'package:bookflights/ui/pages/transaction_page.dart';
import 'package:bookflights/ui/pages/wallet_page.dart';
import 'package:bookflights/ui/widgets/custom_bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';
import 'home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              CustomBottomNavItem(
                index: 0,
                imageUrl: 'assets/icon_home.png',
              ),
              CustomBottomNavItem(
                index: 1,
                imageUrl: 'assets/icon_booking.png',
              ),
              CustomBottomNavItem(
                index: 2,
                imageUrl: 'assets/icon_card.png',
              ),
              CustomBottomNavItem(
                index: 3,
                imageUrl: 'assets/icon_settings.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(state),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
