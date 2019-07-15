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
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (
              layoutContext,
              constraints,
            ) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions yet!',
                    style: theme.textTheme.title,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) => Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(
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
                  style: theme.textTheme.title,
                ),
                subtitle: Text(
                  DateFormat.yMMM().format(transactions[index].date),
                ),
                trailing: mediaQuery.size.width > 460
                    ? FlatButton.icon(
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                      textColor: theme.errorColor,
                      onPressed: () {
                        handleRemoveTransaction(transactions[index].id);
                      },
                    )
                    : IconButton(
                        color: theme.errorColor,
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          handleRemoveTransaction(transactions[index].id);
                        },
                      ),
              ),
            ),
            itemCount: transactions.length,
          );
  }
}
