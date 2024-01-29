import 'package:expense_tracker/category_enum.dart';
import 'package:expense_tracker/widget/expenseList/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widget/new_expense.dart';
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
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Movie',
        amount: 20.00,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Grocories',
        amount: 240.50,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Vacation',
        amount: 450.50,
        date: DateTime.now(),
        category: Category.travel),
  ];

  void _openOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _registeredExpense));
  }

  void _registeredExpense(Expense expense) {
    setState(() {
      _dummyExpense.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Builder(builder: (context) {
        return Column(
          children: [
            const Text('Expense Chart'),
            Expanded(
              child: ExpenseList(expenses: _dummyExpense),
            ),
          ],
        );
      }),
    );
  }
}
