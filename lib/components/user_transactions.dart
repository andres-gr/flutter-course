import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({
    Key key,
  }) : super(key: key);

  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 60.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New vest',
      amount: 12.99,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(
    String title,
    double amount,
  ) {
    final nextTransaction = Transaction(
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
      title: title,
    );

    setState(() {
      _userTransactions.add(nextTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(
          handleNextTransaction: _addTransaction,
        ),
        TransactionList(
          transactions: _userTransactions,
        ),
      ],
    );
  }
}
