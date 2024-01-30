import 'package:expense_tracker/category_enum.dart';
import 'package:expense_tracker/model/expense.dart';

class ExpenseChart {
  const ExpenseChart({
    required this.category,
    required this.expenses,
  });

  ExpenseChart.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalSum {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
