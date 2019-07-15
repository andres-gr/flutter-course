import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({
    Key key,
    @required this.recentTransactions,
  }) : super(key: key);

  List<Map<String, Object>> get _groupedTransactionValues {
    var max = recentTransactions.length;
    return List.generate(
      7,
      (int index) {
        double sum = 0;
        final weekDay = DateTime.now().subtract(
          Duration(
            days: index,
          ),
        );

        for (var i = 0; i < max; i += 1) {
          if (recentTransactions[i].date.day == weekDay.day &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.year == weekDay.year) {
            sum += recentTransactions[i].amount;
          }
        }

        final result = {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': sum,
        };

        return result;
      },
    ).reversed.toList();
  }

  double get _totalSpending {
    var init = 0.0;
    return _groupedTransactionValues.fold(
      init,
      (sum, item) => sum += item['amount'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _groupedTransactionValues
              .map(
                (val) => Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    label: val['day'],
                    spendingAmount: val['amount'],
                    spendingPercent: _totalSpending == 0
                        ? 0
                        : (val['amount'] as double) / _totalSpending,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
