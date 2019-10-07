import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate;

  void submitData() {
    final enteredTitle = descriptionController;
    final enteredAmount = amountController;
    if (enteredTitle.text.isEmpty ||
        enteredAmount.text.isEmpty ||
        double.parse(enteredAmount.text) <= 0 ||
        selectedDate == null) {
      return;
    }

    widget.addTransaction(
      enteredTitle.text,
      double.parse(enteredAmount.text),
      selectedDate,
    );

    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 730)),
      lastDate: DateTime.now(),
    ).then((recievedDate) {
      if (recievedDate == null) {
        return;
      }
      setState(() {
        selectedDate = recievedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          margin: EdgeInsets.only(
            right: 10,
            left: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Expense discription',
                ),
                controller: descriptionController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'amount',
                ),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(selectedDate == null
                      ? 'No date choosen.\n'
                      : 'Selected Date: ${DateFormat('dd MMM yyyy').format(selectedDate)}'),
                  FlatButton(
                    child: Text(
                      'Select Date',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: presentDatePicker,
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: RaisedButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Text(
                      'Add Expense',
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  onPressed: submitData,
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
