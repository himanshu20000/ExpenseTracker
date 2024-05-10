import 'package:cipherx_expense_tracker/Constants/Colors.dart';
import 'package:cipherx_expense_tracker/providers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Authprovider>(context);
    final _formKey = GlobalKey<FormState>();
    final Sizes = MediaQuery.of(context).size;
    final name = TextEditingController();
    final emailAddres = TextEditingController();
    final password = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Sign Up'),
        leading: Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.height * .025),
          child: Column(
            children: [
              SizedBox(
                height: Sizes.height * 0.07,
              ),
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.width * .035),
                        borderSide: BorderSide(color: mainColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.width * .035),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      hintText: 'Name',
                    ),
                  ),
                  SizedBox(
                    height: Sizes.height * 0.03,
                  ),
                  TextFormField(
                    controller: emailAddres,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.width * .035),
                        borderSide: BorderSide(color: mainColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.width * .035),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      hintText: 'Email',
                    ),
                    // validator: (value) {
                    //   // Add validator to check if field is empty
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your email address';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(
                    height: Sizes.height * 0.03,
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.width * .035),
                        borderSide: BorderSide(color: mainColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.width * .035),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      hintText: 'Password',
                    ),
                    // validator: (value) {
                    //   // Add validator to check if field is empty
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your password';
                    //   }
                    //   return null;
                    // },
                  ),
                ],
              ),
              SizedBox(
                height: Sizes.height * 0.03,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Container(
                    height: Sizes.height * 0.04,
                    width: Sizes.height * 0.04,
                    child: Checkbox(
                      activeColor: mainColor,
                      value: provider.ischecked,
                      onChanged: (bool? valueF) {
                        provider.isCheckbox(valueF!);
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("By signing up, you agree to the"),
                          Text(
                            " Terms of",
                            style: TextStyle(color: mainColor),
                          ),
                        ],
                      ),
                      Text(
                        "Service and Privacy Policy",
                        style: TextStyle(color: mainColor),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: Sizes.height * 0.03,
              ),
              Container(
                width: double.infinity,
                height: Sizes.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    if (name.text.isEmpty) {
                      // Check if form is valid
                      // If form is valid, perform sign-up action
                      // For now, print success
                      Fluttertoast.showToast(
                          msg: "Failed to sign up",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black54,
                          textColor: Colors.white,
                          fontSize: Sizes.height * .02);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.width * .035),
                    ),
                  ),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.width * 0.05,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Sizes.height * 0.02,
              ),
              Text(
                'Or with',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Sizes.width * 0.05,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                ),
              ),
              SizedBox(
                height: Sizes.height * 0.02,
              ),
              Container(
                width: double.infinity,
                height: Sizes.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    provider.signUpWithGoogle(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.width * .035),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Gicon.png',
                        height: 50.h,
                        width: 50.h,
                      ),
                      Text(
                        'Sign Up with Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.width * 0.05,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Sizes.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: Sizes.width * 0.04,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: Sizes.width * 0.01,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: Sizes.width * 0.04,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
