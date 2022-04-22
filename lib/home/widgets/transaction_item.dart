//import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionItem extends StatefulWidget {
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
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor = Colors.black;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.purple,
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

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
          // backgroundColor: Theme.of(context).primaryColor,
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${widget.transaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        trailing: widget.mediaQuery.size.width > 360
            ? TextButton.icon(
                //textColor: Theme.of(context).errorColor,
                icon: const Icon(Icons.delete),
                onPressed: () => widget.deletetx(widget.transaction.id),
                label: const Text('Delete'),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deletetx(widget.transaction.id),
              ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          //DateFormat.HOUR_MINUTE_GENERIC_TZ....
          DateFormat('dd/MM/yyyy').format(widget.transaction.date),
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
