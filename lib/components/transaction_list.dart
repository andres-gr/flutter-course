import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  final Function handleRemoveTransaction;

  const TransactionList({
    Key key,
    @required this.handleRemoveTransaction,
    @required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 16),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) => Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                          '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMM().format(transactions[index].date),
                  ),
                  trailing: IconButton(
                    color: Theme.of(context).errorColor,
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      handleRemoveTransaction(transactions[index].id);
                    },
                  ),
                ),
              ),
              itemCount: transactions.length,
            ),
    );
  }
}
