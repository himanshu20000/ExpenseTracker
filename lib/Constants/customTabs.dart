import 'package:cipherx_expense_tracker/Constants/Colors.dart';
import 'package:flutter/material.dart';

class CustomTabss extends StatefulWidget {
  const CustomTabss({Key? key});

  @override
  State<CustomTabss> createState() => _CustomTabssState();
}

class _CustomTabssState extends State<CustomTabss> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTabContainer(0, 'Today'),
        _buildTabContainer(1, 'Week'),
        _buildTabContainer(2, 'Month'),
        _buildTabContainer(3, 'Year'),
      ],
    );
  }

  Widget _buildTabContainer(int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? selectedTab : Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: _selectedIndex == index ? selectedTab : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: _selectedIndex == index ? selectText : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
