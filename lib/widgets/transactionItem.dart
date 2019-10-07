import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';



class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.delTxn,
  }) : super(key: key);

  final Transaction transaction;
  final Function delTxn;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).primaryColor,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: FittedBox(
              child: Text(
                '₹ ${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                    fontFamily: 'QuickSand',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text(
          '${transaction.name}',
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          '${DateFormat('dd MMM, yyyy').format(transaction.now)}',
          style: TextStyle(
              color: Colors.grey[600], fontFamily: 'OpenSans'),
        ),
        trailing: MediaQuery.of(context).size.width > 420
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Colors.red[900],
                onPressed: () {
                  delTxn(transaction.id);
                },
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red[900],
                onPressed: () {
                  delTxn(transaction.id);
                },
              ),
      ),
    );
  }
}