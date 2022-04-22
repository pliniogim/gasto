//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.mediaQuery,
    required this.deletetx,
  }) : super(key: key);

  final Transaction transaction;
  final MediaQueryData mediaQuery;
  final Function deletetx;

  @override
  Widget build(BuildContext context) {
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
                '\$${transaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        trailing: mediaQuery.size.width > 360
            ? TextButton.icon(
                //textColor: Theme.of(context).errorColor,
                icon: const Icon(Icons.delete),
                onPressed: () => deletetx(transaction.id),
                label: const Text('Delete'),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deletetx(transaction.id),
              ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          //DateFormat.HOUR_MINUTE_GENERIC_TZ....
          DateFormat('dd/MM/yyyy').format(transaction.date),
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
  }
}
