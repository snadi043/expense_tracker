import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  Expense({required this.title, required this.amount, required this.date})
      : id = uuid.v4();

  String id;
  String title;
  double amount;
  DateTime date;
}
