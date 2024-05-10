import 'package:cipherx_expense_tracker/animations/Fadeanim.dart';
import 'package:cipherx_expense_tracker/models/category.dart';
import 'package:cipherx_expense_tracker/providers/ExpenseProvider.dart';
import 'package:cipherx_expense_tracker/screens/Expenses/ExpensesScreen.dart';
import 'package:cipherx_expense_tracker/screens/Income/IncomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:cipherx_expense_tracker/Constants/Colors.dart';
import 'package:cipherx_expense_tracker/Constants/caards.dart';
import 'package:cipherx_expense_tracker/Constants/customTabs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key});

  @override
  Widget build(BuildContext context) {
    final Sizes = MediaQuery.of(context).size;
    final provider = Provider.of<ExpenseProvider>(context);
    List<Categories> AllCategory = [
      Categories(
          CateImg: "assets/cart.png",
          Title: "Shopping",
          Desc: "Buy some groceries item",
          addDed: int.parse(provider.ShoppingTotal),
          time: provider.shoppingLastActivityTime,
          cardbg: cartColor),
      Categories(
          CateImg: "assets/subscription.png",
          Title: "Subscription",
          Desc: "Disney+ Annual..",
          addDed: int.parse(provider.SubscriptionTotal),
          time: provider.subscriptionLastActivityTime,
          cardbg: subsColor),
      Categories(
          CateImg: "assets/travel.png",
          Title: "Travel",
          Desc: "Chandigarh to De...",
          addDed: int.parse(provider.Traveltotal),
          time: provider.travelLastActivityTime,
          cardbg: travelColor),
      Categories(
          CateImg: "assets/food.png",
          Title: "Food",
          Desc: "Buy an avacado",
          addDed: int.parse(provider.FoodTotal),
          time: provider.foodLastActivityTime,
          cardbg: foodcolor),
    ];

    AllCategory.sort((a, b) => a.time.compareTo(b.time));

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: Sizes.height * 0.38,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(), // Empty container
            ),
            flexibleSpace: Stack(
              children: [
                Container(
                  height: Sizes.height * 0.38,
                  decoration: BoxDecoration(
                    color: dashboardColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Sizes.height * 0.04),
                      bottomRight: Radius.circular(Sizes.height * 0.04),
                    ),
                  ),
                ),
                Positioned(
                  left: Sizes.height * 0.02,
                  top: Sizes.height * .06,
                  child: Container(
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(Sizes.height * 0.035),
                    ),
                    child: provider.ProfilePicsUrl != ''
                        ? CircleAvatar(
                            radius: Sizes.height * 0.03,
                            backgroundImage:
                                NetworkImage(provider.ProfilePicsUrl),
                          )
                        : CircularProgressIndicator(
                            color: mainColor,
                          ),
                  ),
                ),
                Positioned(
                  top: Sizes.height * .06,
                  left: Sizes.height * 0.18,
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: Sizes.height * 0.04,
                      ),
                      Text(
                        "May",
                        style: TextStyle(
                          fontSize: Sizes.height * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: Sizes.height * 0.02,
                  top: Sizes.height * .06,
                  child: Icon(
                    color: mainColor,
                    Icons.notifications,
                    size: Sizes.height * 0.04,
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Account Balance",
                        style: TextStyle(
                          fontSize: Sizes.height * 0.02,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "₹" + "${provider.TotalExpenses}",
                        style: TextStyle(
                          fontSize: Sizes.height * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: Sizes.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.height * 0.02,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Fadeanim(
                              1.2,
                              Container(
                                width: Sizes.height * 0.2,
                                height: Sizes.height * 0.1,
                                decoration: BoxDecoration(
                                  color: GreenColor,
                                  borderRadius: BorderRadius.circular(
                                    Sizes.height * 0.03,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        Sizes.height * 0.01,
                                      ),
                                      child: Image.asset(
                                        'assets/reci.jpg',
                                        height: Sizes.height * 0.05,
                                        width: Sizes.height * 0.05,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Income",
                                          style: TextStyle(
                                            fontSize: Sizes.height * 0.02,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "₹" + "${provider.IncomeExpense}",
                                          style: TextStyle(
                                            fontSize: Sizes.height * 0.025,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Fadeanim(
                              1.2,
                              Container(
                                width: Sizes.height * 0.2,
                                height: Sizes.height * 0.1,
                                decoration: BoxDecoration(
                                  color: RedColor,
                                  borderRadius: BorderRadius.circular(
                                    Sizes.height * 0.03,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        Sizes.height * 0.01,
                                      ),
                                      child: Image.asset(
                                        'assets/sendi.jpg',
                                        height: Sizes.height * 0.05,
                                        width: Sizes.height * 0.05,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Expenses",
                                          style: TextStyle(
                                            fontSize: Sizes.height * 0.02,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "₹" + "${provider.ExpsenseTotal}",
                                          style: TextStyle(
                                            fontSize: Sizes.height * 0.025,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomTabss(),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.height * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Transaction",
                        style: TextStyle(
                          fontSize: Sizes.height * 0.03,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: recentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Sizes.width * .08),
                          ),
                        ),
                        child: Text(
                          'See All',
                          style: TextStyle(
                            color: recentText,
                            fontWeight: FontWeight.normal,
                            fontSize: Sizes.width * 0.04,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Sizes.height * 0.02,
                ),
                Container(
                  height: Sizes.height * 0.5,
                  child: ListView.separated(
                    padding: EdgeInsets.zero, // Remove default padding
                    scrollDirection: Axis.vertical,
                    itemCount: AllCategory.length,
                    separatorBuilder: (ctx, _) => SizedBox(
                      height: Sizes.height * 0.005,
                    ),
                    itemBuilder: (ctx, index) => Fadeanim(
                      1,
                      Caards(
                        categories: AllCategory[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  textAlign: TextAlign.center,
                  "Choose an option",
                  style: TextStyle(
                    fontSize: Sizes.height * 0.03,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Sizes.height * 0.01))),
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Incomescreen()));
                        // Add your Income button action here
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text(
                        "Income",
                        style: TextStyle(
                          fontSize: Sizes.height * 0.018,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: incomeColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Sizes.height * 0.01))),
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Expensescreen()));
                        // Add your Income button action here
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text(
                        "Expenses",
                        style: TextStyle(
                          fontSize: Sizes.height * 0.018,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: mainColor,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon:
                SizedBox.shrink(), // Placeholder for the floating action button
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true, // Show labels for selected items
        showUnselectedLabels: true, // Show labels for unselected items
      ),
    );
  }
}
