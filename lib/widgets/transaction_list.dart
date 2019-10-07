import 'package:flutter/material.dart';
import './transactionItem.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function delTxn;

  TransactionList(this.transaction, this.delTxn);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Image.asset(
                  'assets/Images/waiting.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                child: Text(
                  'No transactions added yet..!!!',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                child:  TransactionItem(transaction: transaction[index], delTxn: delTxn),
              );
            },
          );
  }
}




