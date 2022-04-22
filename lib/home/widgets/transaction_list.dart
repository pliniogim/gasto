import 'package:flutter/material.dart';
import 'package:gasto/home/widgets/transaction_item.dart';
//import 'package:gasto/home/model/transaction.dart';
//import 'package:intl/intl.dart';

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
    //print('build () Transaction List');
    final mediaQuery = MediaQuery.of(context);
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                transaction: transactions[index],
                mediaQuery: mediaQuery,
                deletetx: deletetx,
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
          );
  }
}
