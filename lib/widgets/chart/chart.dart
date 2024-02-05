import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/expense.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.work),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.leisure),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;
    for (var element in buckets) {
      maxTotalExpense += element.totalExpenses;
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final bool isdarkmode = Theme.of(context).brightness == Brightness.dark;
    log((MediaQuery.of(context).platformBrightness == Brightness.light)
        .toString());

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary.withOpacity(.3),
            Theme.of(context).colorScheme.primary.withOpacity(0)
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
      child: Column(
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final ele in buckets)
                ChartBar(
                    fill: ele.totalExpenses == 0
                        ? 0
                        : ele.totalExpenses / maxTotalExpense),
            ],
          )),
          const SizedBox(height: 12),
          Row(
              children: buckets
                  .map((e) => Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(categoryIcons[e.category],
                            color: isdarkmode
                                ? Theme.of(context).colorScheme.primary
                                : const Color.fromARGB(255, 7, 91, 42)),
                      )))
                  .toList())
        ],
      ),
    );
  }
}
