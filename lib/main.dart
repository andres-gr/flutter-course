import 'package:flutter/material.dart';
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
            Column(
              children: transactions
                  .map(
                    (item) => Card(
                          child: Text(item.title),
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
