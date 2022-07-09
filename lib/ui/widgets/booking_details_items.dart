// ignore_for_file: prefer_const_constructors

import 'package:bookflights/shared/theme.dart';
import 'package:flutter/material.dart';

class BookingDetailsItem extends StatelessWidget {
  final String title;
  final String valueText;
  final Color textColor;

  const BookingDetailsItem(
      {Key? key,
      required this.title,
      required this.valueText,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icon_check.png',
                ),
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle,
          ),
          Spacer(),
          Text(
            valueText,
            style:
                blackTextStyle.copyWith(fontWeight: semiBold, color: textColor),
          ),
        ],
      ),
    );
  }
}
