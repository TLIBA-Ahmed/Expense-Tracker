import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/expense.dart';
import 'package:flutter_application_3/widgets/chart/chart.dart';
import 'package:flutter_application_3/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_application_3/widgets/new_expense.dart';

//import 'package:flutter_application_3/widgets/switchmode.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  List<Expense> registeredExpenses = [
    Expense(
        category: Category.work,
        title: 'Flutter Developping',
        amount: 60.9,
        date: DateTime.now()),
    Expense(
        category: Category.food,
        title: 'Pizza',
        amount: 13.9,
        date: DateTime.now()),
    Expense(
        category: Category.travel,
        title: 'Tunisia',
        amount: 649.9,
        date: DateTime.now()),
    Expense(
        category: Category.leisure,
        title: 'Titanic',
        amount: 8.9,
        date: DateTime.now()),
    Expense(
        category: Category.leisure,
        title: 'Camping',
        amount: 123.9,
        date: DateTime.now()),
    Expense(
        category: Category.food,
        title: 'Sushi',
        amount: 23.9,
        date: DateTime.now()),
    Expense(
        category: Category.work,
        title: 'Data Analyse',
        amount: 74.9,
        date: DateTime.now()),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add((expense));
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      registeredExpenses.remove((expense));
    });
  }

  @override
  Widget build(BuildContext context) {
    //var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense Tracker",
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) => NewExpense(onAddExpense: _addExpense));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Chart(expenses: registeredExpenses)),
          Expanded(
              child: ExpensesList(
            expenses: registeredExpenses,
            onRemoveExpense: _removeExpense,
          ))
        ],
      )),
    );
  }
}
