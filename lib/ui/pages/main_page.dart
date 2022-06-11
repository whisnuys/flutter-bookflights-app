// ignore_for_file: prefer_const_constructors

import 'package:bwa_airplane/ui/widgets/custom_bottom_nav_item.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(){
      return HomePage();
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
                imageUrl: 'assets/icon_home.png',
                isSelected: true,
              ),
              CustomBottomNavItem(
                imageUrl: 'assets/icon_booking.png',
              ),
              CustomBottomNavItem(
                imageUrl: 'assets/icon_card.png',
              ),
              CustomBottomNavItem(
                imageUrl: 'assets/icon_settings.png',
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          buildContent(),
          customBottomNavigation(),
        ],
      ),
    );
  }
}
