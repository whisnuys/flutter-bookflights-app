// ignore_for_file: prefer_const_constructors

import 'package:bookflights/cubit/transaction_cubit.dart';
import 'package:bookflights/shared/theme.dart';
import 'package:bookflights/ui/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TransactionSuccess) {
            if (state.transactions.length == 0) {
              return Center(
                child: Text('You don\'t have any transactions'),
              );
            } else {
              return ListView.builder(
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin, vertical: defaultMargin),
                  itemCount: state.transactions.length,
                  itemBuilder: (context, index) {
                    return TransactionCard(state.transactions[index]);
                  });
            }
          }
          return Center(
            child: Text(
              'Transaction Page',
            ),
          );
        },
      ),
    );
  }
}
