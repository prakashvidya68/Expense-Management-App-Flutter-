import 'package:flutter/foundation.dart';

class Transaction {
  String id;
  String name;
  double amount;
  DateTime now;

  Transaction({
    @required this.id,
    @required this.name,
    @required this.amount,
    @required this.now,
  });
}