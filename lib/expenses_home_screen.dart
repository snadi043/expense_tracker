import 'package:expense_tracker/category_enum.dart';
import 'package:expense_tracker/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _dummyExpense = [
    Expense(
        title: 'Office Trip',
        amount: 200.00,
        date: DateTime(2024 - 01 - 01),
        category: Category.work),
    Expense(
        title: 'Movie',
        amount: 20.00,
        date: DateTime(2024 - 01 - 11),
        category: Category.leisure),
    Expense(
        title: 'Grocories',
        amount: 240.50,
        date: DateTime(2024 - 01 - 15),
        category: Category.food),
    Expense(
        title: 'Vacation',
        amount: 450.50,
        date: DateTime(2024 - 01 - 05),
        category: Category.travel),
  ];

  @override
  build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Expense Add feature'),
          const Text('Expense Chart'),
          Expanded(
            child: ExpenseList(expenses: _dummyExpense),
          ),
        ],
      ),
    );
  }
}
