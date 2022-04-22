import 'package:flutter/material.dart';
import 'package:gasto/home/widgets/transaction_item.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final Function deletetx;
  final List<Transaction> transactions;
  const TransactionList(this.transactions, this.deletetx, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        : ListView(
            children: [
              ...transactions
                  .map((tx) => TransactionItem(
                        key: ValueKey(tx.id),
                        transaction: tx,
                        mediaQuery: mediaQuery,
                        deletetx: deletetx,
                      ))
                  .toList()
            ],
          );
  }
}
