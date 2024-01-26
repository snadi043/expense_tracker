import 'package:expense_tracker/category_enum.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  String id;
  String title;
  double amount;
  Category category;
  DateTime date;
}
