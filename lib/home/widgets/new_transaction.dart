import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

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
              onSubmitted: (_) => submitData(),
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
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            FlatButton(
              onPressed: () {
                //caso 1
                // print(titleInput);
                // print(amountInput);
                submitData;
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
