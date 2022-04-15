import 'package:flutter/material.dart';
import 'package:gasto/home/widgets/user_transaction.dart';
//split
//import 'package:gasto/home/model/transaction.dart';

//split2
// import 'package:gasto/home/widgets/new_transaction.dart';
// import 'package:gasto/home/widgets/transaction_list.dart';

//split
//import 'package:intl/intl.dart';

class GastoHome extends StatelessWidget {
  GastoHome({Key? key}) : super(key: key);

  //split code
  // final List<Transaction> transactions = [
  //   Transaction(
  //     id: 't1',
  //     title: 'New Shoes',
  //     amount: 69.99,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: 't2',
  //     title: 'New Shirts',
  //     amount: 39.99,
  //     date: DateTime.now(),
  //   ),
  // ];

  // caso 1 - erro @immutable
  // String? titleInput;
  // String? amountInput;

  //caso 2
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 50,
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
            UserTransaction(),
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
    );
  }
}
