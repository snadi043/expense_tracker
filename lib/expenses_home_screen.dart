import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  @override
  build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('Expense Add feature'),
          Text('Expense Chart'),
          Text('Added Expense List'),
        ],
      ),
    );
  }
}
