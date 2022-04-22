import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gasto/home/widgets/new_transaction.dart';
import 'package:gasto/home/widgets/transaction_list.dart';
import 'model/transaction.dart';
import 'widgets/chart.dart';

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

  //SPREAD OPERATOR
  List<Widget> _buildPortraitMode(
      MediaQueryData mediaQuery, PreferredSizeWidget appBar, txListWidget) {
    return [
      SizedBox(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            .3,
        child: Chart(_recentTransactions),
      ),
      txListWidget
    ];
  }

  List<Widget> _buildLandscapeMode(
    MediaQueryData mediaQuery,
    PreferredSizeWidget appBar,
    txListWidget,
  ) {
    return [
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
      _showChart
          ? SizedBox(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  .6,
              child: Chart(_recentTransactions),
            )
          : txListWidget
    ];
  }
  //SPREAD OPERATOR

  PreferredSizeWidget _appBarWidget() {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: const Text(
              'Personal Expenses',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: const Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: const Text(
              'Personal Expenses',
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              ),
            ],
          ) as PreferredSizeWidget;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final PreferredSizeWidget appBar = _appBarWidget();
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
            children: [
              if (isLandscape)
                ..._buildLandscapeMode(mediaQuery, appBar, txListWidget),
              //SPREAD OPERATOR TO PULL OUT ALL THE ITEMS INTO WIDGETS
              if (!isLandscape)
                ..._buildPortraitMode(mediaQuery, appBar, txListWidget),
              if (isLandscape)
                ..._buildLandscapeMode(mediaQuery, appBar, txListWidget),
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
