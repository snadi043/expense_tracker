import 'package:expense_tracker/category_enum.dart';
import 'package:expense_tracker/widget/expenseList/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widget/expense_chart/chart.dart';
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
        isScrollControlled: true,
        builder: (ctx) => NewExpense(onAddExpense: _registeredExpense));
  }

  void _registeredExpense(Expense expense) {
    setState(() {
      _dummyExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _dummyExpense.indexOf(expense);
    setState(() {
      _dummyExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense Removed.'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _dummyExpense.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('No expenses found. Try adding some.'),
    );
    if (_dummyExpense.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _dummyExpense,
        onRemove: _removeExpense,
      );
    }
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
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _dummyExpense),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _dummyExpense),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
