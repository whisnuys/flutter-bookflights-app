// ignore_for_file: prefer_const_constructors

import 'package:bookflights/cubit/auth_cubit.dart';
import 'package:bookflights/cubit/destination_cubit.dart';
import 'package:bookflights/cubit/newdestination_cubit.dart';
import 'package:bookflights/models/destination_model.dart';
import 'package:bookflights/ui/widgets/popular_card.dart';
import 'package:bookflights/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    context.read<NewdestinationCubit>().fetchNewDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
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
                          "Howdy,\n${state.user.name}",
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
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget popularDestinations(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: destinations.map((DestinationModel destination) {
              return PopularCard(destination);
            }).toList(),
          ),
        ),
      );
    }

    Widget newDestinations(List<DestinationModel> newDestinations) {
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
            Column(
              children: newDestinations.map((DestinationModel newDestination) {
                return DestinationTile(newDestination);
              }).toList(),
            ),
          ],
        ),
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(
                state.error,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(children: [
            header(),
            popularDestinations(state.destinations),
            BlocConsumer<NewdestinationCubit, NewdestinationState>(
              listener: (context, state) {
                if (state is NewDestinationFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kRedColor,
                      content: Text(
                        state.error,
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is NewDestinationSuccess) {
                  return newDestinations(state.newdestinations);
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ]);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
