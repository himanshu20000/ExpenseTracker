import 'package:hive/hive.dart';

// part 'expense_model.g.dart';

@HiveType(typeId: 0)
class Expense {
  @HiveField(0)
  late String amount;

  @HiveField(1)
  late String category;

  @HiveField(2)
  late String description;

  @HiveField(3)
  late bool isIncome;

  Expense(
      {required this.amount,
      required this.category,
      required this.description,
      required this.isIncome});
}
