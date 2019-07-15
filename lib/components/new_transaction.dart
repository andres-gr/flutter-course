import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_course/components/adaptive_flat_button.dart';

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

  DateTime _pickedDate;

  void _handleSubmit() {
    final title = _titleController.text,
        amount = double.parse(_amountController.text);
    if (title.isEmpty || amount <= 0 || _pickedDate == null) return;
    widget.handleNextTransaction(
      title,
      amount,
      _pickedDate,
    );
    Navigator.of(context).pop();
  }

  void _handleShowDatePicker(
    BuildContext context,
  ) async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    );
    if (date == null) return;
    setState(() {
      _pickedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 8,
            right: 8,
            left: 8,
            bottom: mediaQuery.viewInsets.bottom + 10,
          ),
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _pickedDate != null
                          ? 'Picked date: ${DateFormat.yMd().format(_pickedDate)}'
                          : 'No date!',
                    ),
                  ),
                  AdaptiveFlatButton(
                    handlePress: () {
                      _handleShowDatePicker(context);
                    },
                    text: 'Choose Date',
                  )
                ],
              ),
              RaisedButton(
                color: theme.primaryColor,
                textColor: theme.textTheme.button.color,
                child: const Text('Add Transaction'),
                onPressed: _handleSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
