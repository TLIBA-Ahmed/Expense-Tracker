import 'dart:developer';
import '../models/expense.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.travel;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                keyboardType: TextInputType.text,
                maxLength: 50,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        prefixText: '\$',
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () async {
                      final firstdate = DateTime(DateTime.now().year - 5,
                          DateTime.now().month, DateTime.now().day);
                      final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          firstDate: firstdate,
                          lastDate: DateTime.now());
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_selectedDate == null
                            ? 'No Date Selected'
                            : DateFormat.yMd().format(_selectedDate!)),
                        const Icon(Icons.calendar_month),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  DropdownButton(
                      value: _selectedCategory,
                      items: Category.values
                          .map((e) => DropdownMenuItem(
                              value: e, child: Text(e.name.toUpperCase())))
                          .toList(),
                      onChanged: (newCat) {
                        if (newCat == null) return;
                        setState(() {
                          _selectedCategory = newCat;
                        });
                      }),
                  const Spacer(),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      final double? entredAmount =
                          double.tryParse(_amountController.text);
                      final amoutInvalid =
                          entredAmount == null || entredAmount <= 0;

                      //const snackBar = SnackBar(content: Text("Error"));
                      if (_titleController.text.trim().isEmpty ||
                          amoutInvalid ||
                          _selectedDate == null) {
                        log("erreur");
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: const Text("Invalid Input"),
                                  content: const Text(
                                      "Please make sure valid title, amount, date and category was entered"),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("okay"))
                                  ],
                                ));
                        //ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // matnjmch tji fouk el form sghir donc nestaamlou showDialog
                      } else {
                        widget.onAddExpense(Expense(
                            category: _selectedCategory,
                            title: _titleController.text,
                            amount: entredAmount,
                            date: _selectedDate!));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Save Expense"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
