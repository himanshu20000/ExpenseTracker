import 'package:flutter/material.dart';
import 'package:cipherx_expense_tracker/providers/expense_model.dart';
import 'package:cipherx_expense_tracker/providers/HiveService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseProvider extends ChangeNotifier {
  late SharedPreferences _prefs;
  late List<Expense> _expenses;
  late String TotalExpenses;
  late String IncomeExpense;
  late String ExpsenseTotal;
  late String ShoppingTotal;
  late String SubscriptionTotal;
  late String Traveltotal;
  late String FoodTotal;
  late String ProfilePicsUrl;
  late String shoppingLastActivityTime;
  late String subscriptionLastActivityTime;
  late String travelLastActivityTime;
  late String foodLastActivityTime;

  // Initialize the list of expenses
  ExpenseProvider() {
    _initSharedPreferences();
    _expenses = [];
    IncomeExpense = '0';
    TotalExpenses = '0';
    ExpsenseTotal = '0';
    ProfilePicsUrl = '';
    ShoppingTotal = '0';
    SubscriptionTotal = '0';
    Traveltotal = '0';
    FoodTotal = '0';
    shoppingLastActivityTime = '3:53 AM'; // Default times
    subscriptionLastActivityTime = '3:52 AM';
    travelLastActivityTime = '3:52 AM';
    foodLastActivityTime = '3:52 AM';
    loadExpenses();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    shoppingLastActivityTime =
        _prefs.getString('shoppingLastActivityTime') ?? '3:52 AM';
    subscriptionLastActivityTime =
        _prefs.getString('subscriptionLastActivityTime') ?? '3:53 AM';
    travelLastActivityTime =
        _prefs.getString('travelLastActivityTime') ?? '3:52 AM';
    foodLastActivityTime =
        _prefs.getString('foodLastActivityTime') ?? '3:52 AM';
  }

  // Load expenses from Hive and notify listeners
  Future<void> loadExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final profilePicUrl = prefs.getString('profilePicUrl') ?? '';
    ProfilePicsUrl = profilePicUrl.toString();
    final expenseBox = await HiveService.openExpenseBox();
    _expenses = expenseBox.values.toList();
    await calculateCategorySum();
    notifyListeners();
  }

  // Calculate the sum of the amount according to the category
  Map<String, double> calculateCategorySum() {
    Map<String, double> categorySum = {};
    int res = 0, t1 = 0, t2 = 0, t3 = 0, t4 = 0, incomeExp = 0;

    for (Expense expense in _expenses) {
      double? amount = double.tryParse(expense.amount);
      if (amount != null) {
        if (categorySum.containsKey(expense.category)) {
          categorySum[expense.category] =
              (categorySum[expense.category] ?? 0) + amount;
        } else {
          categorySum[expense.category] = amount;
        }

        if (!expense.isIncome) {
          res += amount.toInt();
          ExpsenseTotal = res.toString();
        }

        if (expense.isIncome) {
          incomeExp += amount.toInt();
          IncomeExpense = incomeExp.toString();
        }
        if (expense.category == 'Shopping' && !expense.isIncome) {
          t1 += amount.toInt();
          ShoppingTotal = t1.toString();
        }
        if (expense.category == 'Subscription' && !expense.isIncome) {
          t2 += amount.toInt();
          SubscriptionTotal = t2.toString();
        }
        if (expense.category == 'Travel' && !expense.isIncome) {
          t3 += amount.toInt();
          Traveltotal = t3.toString();
        }
        if (expense.category == 'Food' && !expense.isIncome) {
          t4 += amount.toInt();
          FoodTotal = t4.toString();
        }
      } else {
        print('Invalid amount: ${expense.amount}');
      }
    }

    TotalExpenses = (incomeExp - res).toString();
    print(ExpsenseTotal!!!!!!!!!!);
    notifyListeners();
    return categorySum;
  }

  Future<void> saveLastActivityTime(String category, String time) async {
    print("Checking now ####################@@@@@@@@@@@@");
    if (category == 'Shopping') {
      await _prefs.setString('shoppingLastActivityTime', time);
    } else if (category == 'Subscription') {
      await _prefs.setString('subscriptionLastActivityTime', time);
    } else if (category == 'Travel') {
      await _prefs.setString('travelLastActivityTime', time);
    } else {
      await _prefs.setString('foodLastActivityTime', time);
    }
    await _initSharedPreferences();
    notifyListeners();
  }

  // Calculate the total sum of the amount of all categories
  double calculateTotalSum() {
    double totalSum = 0;
    for (Expense expense in _expenses) {
      totalSum += double.parse(expense.amount);
    }
    return totalSum;
  }
}
