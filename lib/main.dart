import 'package:flutter/material.dart';
import 'package:expense_tracker/expense.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Expense(),
      ),
    );
  }
}
