// ignore_for_file: prefer_const_constructors

import 'package:bookflights/ui/widgets/destination_card.dart';
import 'package:bookflights/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Howdy,\nKezia Anne",
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    "Where to fly today?",
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/image_profile.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget popularDestinations() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              PopularCard(
                name: 'Lake Ciliwung',
                city: 'Tangerang',
                imageUrl: 'assets/image_destination1.png',
                rating: '4.8',
              ),
              PopularCard(
                name: 'White Houses',
                city: 'Spain',
                imageUrl: 'assets/image_destination2.png',
                rating: '4.7',
              ),
              PopularCard(
                name: 'Hill Heyo',
                city: 'Monaco',
                imageUrl: 'assets/image_destination3.png',
                rating: '4.8',
              ),
              PopularCard(
                name: 'Menarra',
                city: 'Japan',
                imageUrl: 'assets/image_destination4.png',
                rating: '5.0',
              ),
              PopularCard(
                name: 'Payung Teduh',
                city: 'Singapore',
                imageUrl: 'assets/image_destination5.png',
                rating: '4.8',
              ),
              SizedBox(
                width: defaultMargin,
              ),
            ],
          ),
        ),
      );
    }

    Widget newDestinations() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            DestinationTile(
              name: 'Danau Beratan',
              city: 'Singaraja',
              imageUrl: 'assets/image_destination6.png',
              rating: '4.5',
            ),
            DestinationTile(
              name: 'Sydney Opera',
              city: 'Australia',
              imageUrl: 'assets/image_destination7.png',
              rating: '4.7',
            ),
            DestinationTile(
              name: 'Roma',
              city: 'Italy',
              imageUrl: 'assets/image_destination8.png',
              rating: '4.8',
            ),
            DestinationTile(
              name: 'Payug Teduh',
              city: 'Singapore',
              imageUrl: 'assets/image_destination9.png',
              rating: '4.8',
            ),
            DestinationTile(
              name: 'Hill Hey',
              city: 'Monaco',
              imageUrl: 'assets/image_destination10.png',
              rating: '4.8',
            ),
          ],
        ),
      );
    }

    return ListView(children: [
      header(),
      popularDestinations(),
      newDestinations(),
    ]);
  }
}
