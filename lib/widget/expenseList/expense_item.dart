import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/category_enum.dart';
import 'package:intl/intl.dart';

var dateFormatter = DateFormat.yMd();
var dateString = dateFormatter.format(DateTime.now());

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(expenseIcon[expense.category]),
                    const SizedBox(width: 8),
                    Text(dateString),
                    // Text(expense.category.name),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}