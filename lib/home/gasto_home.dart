import 'package:flutter/material.dart';
import 'package:gasto/home/model/transaction.dart';

class GastoHome extends StatelessWidget {
  GastoHome({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Shirts',
      amount: 39.99,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          width: double.infinity,
          child: const Card(
            color: Colors.red,
            child: Text(
              'CHART',
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: transactions
              .map(
                (e) => Card(
                  child: Text(e.title),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
