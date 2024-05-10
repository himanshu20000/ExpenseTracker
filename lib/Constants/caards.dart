import 'package:cipherx_expense_tracker/Constants/Colors.dart';
import 'package:cipherx_expense_tracker/models/category.dart';
import 'package:flutter/material.dart';

class Caards extends StatelessWidget {
  Caards({super.key, required this.categories});

  Categories categories;

  @override
  Widget build(BuildContext context) {
    final Sizes = MediaQuery.of(context).size;
    return Container(
      height: Sizes.height * 0.12,
      width: Sizes.width,
      decoration: BoxDecoration(
          color: cardBase,
          borderRadius: BorderRadius.circular(Sizes.height * .02)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.height * 0.0122),
            child: Container(
              height: Sizes.height * 0.08,
              width: Sizes.height * 0.08,
              decoration: BoxDecoration(
                  color: categories.cardbg,
                  borderRadius: BorderRadius.circular(Sizes.height * .03)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.height * 0.01),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    categories.CateImg,
                    height: Sizes.height * 0.05,
                    width: Sizes.height * 0.05,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: Sizes.height * 0.01,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                categories.Title,
                style: TextStyle(
                    fontSize: Sizes.height * 0.025,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: Sizes.height * 0.02,
              ),
              Text(
                categories.Desc,
                style: TextStyle(
                    fontSize: Sizes.height * 0.02,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  categories.addDed.toString(),
                  style: TextStyle(
                      fontSize: Sizes.height * 0.025,
                      color: Colors.red,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: Sizes.height * 0.02,
                ),
                Text(
                  categories.time,
                  style: TextStyle(
                      fontSize: Sizes.height * 0.015,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            width: Sizes.height * 0.025,
          )
        ],
      ),
    );
  }
}
