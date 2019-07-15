import 'dart:io';

import 'package:flutter/cupertino.dart';
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
  final List<Transaction> _userTransactions = [];

  bool _showChart = false;

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
    DateTime date,
  ) {
    final nextTransaction = Transaction(
      amount: amount,
      date: date,
      id: DateTime.now().toString(),
      title: title,
    );

    setState(() {
      _userTransactions.add(nextTransaction);
    });
  }

  void _removeTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((item) => item.id == id);
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
    final title = const Text('Personal Expenses');
    final navAddButton = Platform.isIOS
        ? GestureDetector(
            child: Icon(CupertinoIcons.add),
            onTap: () => _handleOpenModal(context),
          )
        : IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _handleOpenModal(context),
          );
    final mediaQuery = MediaQuery.of(context);
    final bool isLandscape = mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: title,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                navAddButton,
              ],
            ),
          )
        : AppBar(
            title: title,
            actions: <Widget>[
              navAddButton,
            ],
          );
    final list = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(
        handleRemoveTransaction: _removeTransaction,
        transactions: _userTransactions,
      ),
    );
    final body = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Show chart',
                    style: Theme.of(context).textTheme.title,
                  ),
                  Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  ),
                ],
              ),
            if (!isLandscape)
              Container(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.3,
                child: Chart(
                  recentTransactions: _recentTransactions,
                ),
              ),
            if (!isLandscape) list,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.7,
                      child: Chart(
                        recentTransactions: _recentTransactions,
                      ),
                    )
                  : list,
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: body,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: body,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _handleOpenModal(context),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
