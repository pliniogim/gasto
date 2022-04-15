import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              //caso 1
              // onChanged: (val) => titleInput = val,

              //caso 2
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              //caso 1
              // onChanged: (value) {
              //   amountInput = value;
              // },

              //caso 2
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            FlatButton(
              onPressed: () {
                //caso 1
                // print(titleInput);
                // print(amountInput);
                addTx(
                    titleController.text, double.parse(amountController.text));
                //caso 2
                print(titleController.text);
                print(amountController.text);
              },
              child: const Text('Add Transaction'),
              textColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
