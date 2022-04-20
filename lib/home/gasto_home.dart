import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gasto/home/widgets/new_transaction.dart';
import 'package:gasto/home/widgets/transaction_list.dart';
//import 'package:gasto/home/widgets/user_transaction.dart';
import 'model/transaction.dart';
import 'widgets/chart.dart';
//split
//import 'package:gasto/home/model/transaction.dart';

//split2
// import 'package:gasto/home/widgets/new_transaction.dart';
// import 'package:gasto/home/widgets/transaction_list.dart';

//split
//import 'package:intl/intl.dart';

class GastoHome extends StatefulWidget {
  const GastoHome({Key? key}) : super(key: key);

  @override
  State<GastoHome> createState() => _GastoHomeState();
}

class _GastoHomeState extends State<GastoHome> {
  final List<Transaction> _userTransactions = [
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

  //switch
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newtx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: chosenDate,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newtx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  //split code
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    bool isLandscape = mediaQuery.orientation == Orientation.landscape;
    var appBar = AppBar(
      title: const Text(
        'Personal Expenses',
        //or appbar theme data
        // style: TextStyle(
        //   fontFamily: 'OpenSans',
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: const Icon(Icons.add),
        )
      ],
    );
    final txListWidget = SizedBox(
      child: TransactionList(_userTransactions, _deleteTransaction),
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
    );
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (isLandscape)
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Show Chart',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Switch.adaptive(
                      //adapts android or ios
                      value: _showChart,
                      onChanged: (val) {
                        setState(() {
                          _showChart = val;
                        });
                      }),
                ]),
              if (!isLandscape)
                SizedBox(
                  height: (mediaQuery.size.height -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      .3,
                  child: Chart(_recentTransactions),
                ),
              if (!isLandscape) txListWidget,
              if (isLandscape)
                _showChart
                    ? SizedBox(
                        height: (mediaQuery.size.height -
                                appBar.preferredSize.height -
                                mediaQuery.padding.top) *
                            .6,
                        child: Chart(_recentTransactions),
                      )
                    : txListWidget
              // const SizedBox(
              //   height: 10,
              // ),
              //split
              // Card(
              //   elevation: 10,
              //   child: Container(
              //     padding: EdgeInsets.all(10),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.end,
              //       children: <Widget>[
              //         TextField(
              //           //caso 1
              //           // onChanged: (val) => titleInput = val,

              //           //caso 2
              //           controller: titleController,
              //           decoration: const InputDecoration(
              //             labelText: 'Title',
              //           ),
              //         ),
              //         TextField(
              //           //caso 1
              //           // onChanged: (value) {
              //           //   amountInput = value;
              //           // },

              //           //caso 2
              //           controller: amountController,
              //           decoration: const InputDecoration(
              //             labelText: 'Amount',
              //           ),
              //         ),
              //         FlatButton(
              //           onPressed: () {
              //             //caso 1
              //             // print(titleInput);
              //             // print(amountInput);

              //             //caso 2
              //             print(titleController.text);
              //             print(amountController.text);
              //           },
              //           child: const Text('Add Transaction'),
              //           textColor: Colors.blue,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              //split2
              // NewTransaction(),
              // TransactionList(),

              //split
              // Column(
              //   children: transactions
              //       .map(
              //         (e) => Card(
              //           child: Row(
              //             children: [
              //               Container(
              //                 padding: const EdgeInsets.all(10),
              //                 margin: const EdgeInsets.symmetric(
              //                   vertical: 10,
              //                   horizontal: 20,
              //                 ),
              //                 decoration: BoxDecoration(
              //                   border: Border.all(
              //                     color: Colors.black,
              //                     width: 2,
              //                   ),
              //                 ),
              //                 child: Text(
              //                   '\$${e.amount}',
              //                   style: const TextStyle(
              //                     fontSize: 22,
              //                     fontWeight: FontWeight.bold,
              //                     color: Colors.purple,
              //                   ),
              //                 ),
              //               ),
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: <Widget>[
              //                   Text(
              //                     e.title,
              //                     style: const TextStyle(
              //                       fontSize: 18,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //                   Text(
              //                     //DateFormat.HOUR_MINUTE_GENERIC_TZ....
              //                     DateFormat('dd/MM/yyyy').format(e.date),
              //                     style: const TextStyle(
              //                       color: Colors.grey,
              //                       fontSize: 14,
              //                       fontStyle: FontStyle.italic,
              //                       fontWeight: FontWeight.w400,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       )
              //       .toList(),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
    );
  }
}
