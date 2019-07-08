import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function handleNextTransaction;

  const NewTransaction({
    Key key,
    @required this.handleNextTransaction,
  }) : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void _handleSubmit() {
    final title = _titleController.text,
        amount = double.parse(_amountController.text);

    if (title.isEmpty || amount <= 0) return;

    widget.handleNextTransaction(
      title,
      amount,
    );
    
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
              controller: _titleController,
              onSubmitted: (_) => _handleSubmit(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _handleSubmit(),
            ),
            FlatButton(
              textColor: Colors.purple,
              child: const Text('Add Transaction'),
              onPressed: _handleSubmit,
            )
          ],
        ),
      ),
    );
  }
}
