// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget headerImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/image_destination1.png'),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: 214,
          margin: EdgeInsets.only(top: 236),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.95),
              ],
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        child: Column(
          children: [
            //  NOTE: Emblem
            Container(
              width: 108,
              height: 24,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_emblem.png'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 256),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lake Ciliwung',
                          style: whiteTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'Tangerang',
                          style: whiteTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        margin: EdgeInsets.only(right: 2),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_star.png'),
                          ),
                        ),
                      ),
                      Text(
                        '4.8',
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            headerImage(),
            content(),
          ],
        ));
  }
}
