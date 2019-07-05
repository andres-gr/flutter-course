import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:udemy_course/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 100,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: const Text('Chart'),
              ),
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount',
                      ),
                    ),
                    FlatButton(
                      textColor: Colors.purple,
                      child: const Text('Add Transaction'),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transactions
                  .map(
                    (item) => Card(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.purple,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  '\$${item.amount}',
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    DateFormat.yMMMd().format(item.date),
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
