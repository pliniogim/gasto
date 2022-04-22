import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gasto/home/widgets/adaptative_button.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() {
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  _NewTransactionState();

  @override
  void initState() {
    super.initState(); //parent class = super
  }

  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _presentDayPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(
          () {
            _selectedDate = pickedDate;
          },
        );
      },
    );
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // ignore: unnecessary_null_comparison
                      _selectedDate == null
                          ? 'No date chosen!'
                          : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                    AdaptativeFlatButton('Choose Date', _presentDayPicker),
                  ],
                ),
              ),
              Platform.isIOS
                  ? CupertinoButton(
                      child: const Text('Add Transaction'),
                      onPressed: () {
                        _submitData();
                      },
                    )
                  : ElevatedButton(
                      onPressed: () {
                        _submitData();
                      },
                      child: const Text('Add Transaction'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
