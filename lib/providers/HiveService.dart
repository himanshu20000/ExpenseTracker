import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'expense_model.dart';

class HiveService {
  static Future<void> initHive() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    // Remove the registration of the adapter here
  }

  static Future<Box<Expense>> openExpenseBox() async {
    // Make sure Hive is initialized before opening the box
    await initHive();
    return await Hive.openBox<Expense>('expenses');
  }
}

class ExpenseAdapter extends TypeAdapter<Expense> {
  @override
  final int typeId = 0; // Ensure consistency with the registration

  @override
  Expense read(BinaryReader reader) {
    return Expense(
      amount: reader.readString(),
      category: reader.readString(),
      description: reader.readString(),
      isIncome: reader.readBool(), // Include reading isIncome
    );
  }

  @override
  void write(BinaryWriter writer, Expense obj) {
    writer.writeString(obj.amount);
    writer.writeString(obj.category);
    writer.writeString(obj.description);
    writer.writeBool(obj.isIncome); // Include writing isIncome
  }
}
