import 'package:expense_tracker/widget/expenseList/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemove});

  final List<Expense> expenses;
  final Function(Expense expense) onRemove;

  @override
  build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.8),
            margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal)),
        key: ValueKey(expenses[index]),
        child: ExpenseItem(expenses[index]),
        onDismissed: (direction) => {
          onRemove(expenses[index]),
        },
      ),
    );
  }
}
