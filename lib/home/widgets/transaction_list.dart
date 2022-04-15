import 'package:flutter/material.dart';
//import 'package:gasto/home/model/transaction.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  // const TransactionList({Key? key, required this.transactions})
  //     : super(key: key);

  //TransactionList({Key? key}) : super(key: key);
  // @override
  // State<TransactionList> createState() => _TransactionListState();
  // }

  // class _TransactionListState extends State<TransactionList> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map(
            (e) => Card(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      '\$${e.amount}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        e.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        //DateFormat.HOUR_MINUTE_GENERIC_TZ....
                        DateFormat('dd/MM/yyyy').format(e.date),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
