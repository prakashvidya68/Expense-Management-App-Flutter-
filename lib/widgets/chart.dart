import 'package:flutter/material.dart';
import '../widgets/chartbars.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      var totalAmount = 0.00;
      final dayOfWeek = DateTime.now().subtract(
        Duration(days: index),
      );

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].now.day == dayOfWeek.day &&
            recentTransactions[i].now.month == dayOfWeek.month &&
            recentTransactions[i].now.year == dayOfWeek.year) {
          totalAmount += recentTransactions[i].amount;
        }
      }

      // print(DateFormat.E().format(dayOfWeek));
      // print(totalAmount);

      return {
        'day': DateFormat.E().format(dayOfWeek).substring(0, 1),
        'amount': totalAmount,
      };
    }).reversed.toList();
  }

  double get weekXpnz {
    return groupedTransactionsValues.fold(0.00, (
      amnt,
      element,
    ) {
      return amnt + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
        left: 8.0,
        top: 8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupedTransactionsValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: Bars(
                  data['day'],
                  data['amount'],
                  weekXpnz == 0 ? 0.0 : (data['amount'] as double) / weekXpnz,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
