import 'package:flutter/material.dart';

import 'components/chart.dart';
import 'components/new_transaction.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New shoes',
    //   amount: 60.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'New vest',
    //   amount: 12.99,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where(
          (val) => val.date.isAfter(
            DateTime.now().subtract(
              Duration(days: 7),
            ),
          ),
        )
        .toList();
  }

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

  void _handleOpenModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.opaque,
        child: NewTransaction(
          handleNextTransaction: _addTransaction,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _handleOpenModal(context),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Chart(
            recentTransactions: _recentTransactions,
          ),
          TransactionList(
            transactions: _userTransactions,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _handleOpenModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
