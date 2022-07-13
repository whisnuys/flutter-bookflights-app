// ignore_for_file: prefer_const_constructors

import 'package:bookflights/models/destination_model.dart';
import 'package:bookflights/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class DestinationTile extends StatelessWidget {
  final DestinationModel newDestination;

  const DestinationTile(
    this.newDestination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(newDestination),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.fromLTRB(10, 10, 16, 10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(newDestination.imageUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newDestination.name,
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    newDestination.city,
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
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
                  newDestination.rating.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
