import 'package:flutter/material.dart';
//import 'package:gasto/home/model/transaction.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final Function deletetx;
  final List<Transaction> transactions;
  const TransactionList(this.transactions, this.deletetx, {Key? key})
      : super(key: key);

  // const TransactionList({Key? key, required this.transactions})
  //     : super(key: key);

  //TransactionList({Key? key}) : super(key: key);
  // @override
  // State<TransactionList> createState() => _TransactionListState();
  // }

  // class _TransactionListState extends State<TransactionList> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 20.0,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                          ),
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deletetx(transactions[index].id),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      //DateFormat.HOUR_MINUTE_GENERIC_TZ....
                      DateFormat('dd/MM/yyyy').format(transactions[index].date),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                      ),

                      //alternativa
                      // return Card(
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         padding: const EdgeInsets.all(10),
                      //         margin: const EdgeInsets.symmetric(
                      //           vertical: 10,
                      //           horizontal: 20,
                      //         ),
                      //         decoration: BoxDecoration(
                      //           border: Border.all(
                      //             color: Theme.of(context).primaryColor,
                      //             width: 2,
                      //           ),
                      //         ),
                      //         child: Text(
                      //           '\$${transactions[index].amount.toStringAsFixed(2)}',
                      //           style: TextStyle(
                      //             fontSize: 22,
                      //             fontWeight: FontWeight.bold,
                      //             color: Theme.of(context).primaryColor,
                      //           ),
                      //         ),
                      //       ),
                      //       Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: <Widget>[
                      //           Text(
                      //             transactions[index].title,
                      //             style: Theme.of(context).textTheme.headline6,
                      //             // style: const TextStyle(
                      //             //   fontSize: 18,
                      //             //   fontWeight: FontWeight.bold,
                      //             // ),
                      //           ),
                      //           Text(
                      //             //DateFormat.HOUR_MINUTE_GENERIC_TZ....
                      //             DateFormat('dd/MM/yyyy')
                      //                 .format(transactions[index].date),
                      //             style: const TextStyle(
                      //               color: Colors.grey,
                      //               fontSize: 14,
                      //               fontStyle: FontStyle.italic,
                      //               fontWeight: FontWeight.w400,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // );
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
              //listview.builder transform
              // children: transactions
              //     .map(
              // (e) =>
              //listvbuilder
              // Card(
              //   child: Row(
              //     children: [
              //       Container(
              //         padding: const EdgeInsets.all(10),
              //         margin: const EdgeInsets.symmetric(
              //           vertical: 10,
              //           horizontal: 20,
              //         ),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Colors.black,
              //             width: 2,
              //           ),
              //         ),
              //         child: Text(
              //           '\$${e.amount}',
              //           style: const TextStyle(
              //             fontSize: 22,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.purple,
              //           ),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Text(
              //             e.title,
              //             style: const TextStyle(
              //               fontSize: 18,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           Text(
              //             //DateFormat.HOUR_MINUTE_GENERIC_TZ....
              //             DateFormat('dd/MM/yyyy').format(e.date),
              //             style: const TextStyle(
              //               color: Colors.grey,
              //               fontSize: 14,
              //               fontStyle: FontStyle.italic,
              //               fontWeight: FontWeight.w400,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // )
              // .toList(),
            ),
    );
  }
}
