import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Text(
                  expense.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text('\$${expense.amount.toStringAsFixed(2)}'),
                    const Spacer(),
                    Row(children: [
                      Icon(categoryIcons[expense.category]),
                      const SizedBox(width: 7),
                      Text(expense.formatedDate())
                    ])
                  ],
                )
              ],
            )));
  }
}
