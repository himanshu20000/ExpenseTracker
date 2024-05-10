import 'package:cipherx_expense_tracker/Constants/Colors.dart';
import 'package:cipherx_expense_tracker/providers/ExpenseProvider.dart';
import 'package:cipherx_expense_tracker/providers/HiveService.dart';
import 'package:cipherx_expense_tracker/providers/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Incomescreen extends StatefulWidget {
  const Incomescreen({super.key});

  @override
  State<Incomescreen> createState() => _IncomescreenState();
}

class _IncomescreenState extends State<Incomescreen> {
  @override
  String? _selectedOption;
  String? _selectedWallet;
  DateTime now = DateTime.now();
  late TextEditingController amountController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context, listen: false);
    final Sizes = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            provider.loadExpenses();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          "Income",
          style: TextStyle(
            fontSize: Sizes.height * 0.03,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Sizes.height * 0.4,
              width: Sizes.width,
              child: Stack(
                children: [
                  Positioned(
                    bottom: Sizes.height * 0.12,
                    left: Sizes.height * 0.025,
                    child: Text(
                      "How much?",
                      style: TextStyle(
                        fontSize: Sizes.height * 0.025,
                        color: IncText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Sizes.height * 0,
                    left: Sizes.height * 0.025,
                    child: Container(
                      width: Sizes.width * 0.9,
                      child: TextFormField(
                        controller: amountController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: Sizes.height * 0.08,
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '₹ 0',
                          hintStyle: TextStyle(
                            fontSize: Sizes.height * 0.08,
                            color: Colors.white,
                          ),
                        ),
                        onChanged: (newValue) {
                          print(amountController.text);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Sizes.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Sizes.height * 0.03),
                  topRight: Radius.circular(Sizes.height * 0.03),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.height * .02),
                child: Column(
                  children: [
                    SizedBox(height: Sizes.height * 0.06),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                          borderRadius:
                              BorderRadius.circular(Sizes.height * 0.01),
                        ),
                        hintText: 'Select an option',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: Sizes.height * 0.02,
                          vertical: Sizes.height * 0.02,
                        ),
                      ),
                      value: _selectedOption,
                      onChanged: (newValue) {
                        print(newValue);
                        setState(() {
                          _selectedOption = newValue;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          value: 'Shopping',
                          child: Text('Shopping'),
                        ),
                        DropdownMenuItem(
                          value: 'Subscription', // Ensure this value is unique
                          child: Text('Subscription'),
                        ),
                        DropdownMenuItem(
                          value: 'Travel',
                          child: Text('Travel'),
                        ),
                        DropdownMenuItem(
                          value: 'Food',
                          child: Text('Food'),
                        ),
                      ],
                    ),
                    SizedBox(height: Sizes.height * 0.02),
                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            Sizes.height * 0.01,
                          ),
                          borderSide: BorderSide(color: mainColor, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            Sizes.height * 0.01,
                          ),
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        hintText: 'Description',
                      ),
                    ),
                    SizedBox(height: Sizes.height * 0.02),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(
                            Sizes.height * 0.01,
                          ),
                        ),
                        hintText: 'Select an option',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: Sizes.height * 0.02,
                          vertical: Sizes.height * 0.02,
                        ),
                      ),
                      value: _selectedWallet,
                      onChanged: (newValue) {
                        print(newValue);
                      },
                      items: [
                        DropdownMenuItem(
                          value: 'Personal',
                          child: Text('Personal'),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: double.infinity,
                      height: Sizes.height * 0.07,
                      child: ElevatedButton(
                        onPressed: () async {
                          String time = (DateFormat('HH:MM').format(now));
                          final expenseBox = await HiveService.openExpenseBox();
                          final expense = Expense(
                            amount: amountController.text,
                            category: _selectedOption ?? '',
                            description: descriptionController.text,
                            isIncome: true,
                          );
                          expenseBox.add(expense);
                          await provider.loadExpenses();

                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: incomeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Sizes.width * .035),
                          ),
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.width * 0.05,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Sizes.height * 0.05),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
