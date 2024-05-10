import 'package:cipherx_expense_tracker/providers/ExpenseProvider.dart';
import 'package:cipherx_expense_tracker/providers/HiveService.dart';
import 'package:cipherx_expense_tracker/providers/authProvider.dart';
import 'package:cipherx_expense_tracker/screens/Intro.dart';
import 'package:cipherx_expense_tracker/screens/authentication/signupScreen.dart';
import 'package:cipherx_expense_tracker/screens/dashboard/Dashboard.dart';
import 'package:cipherx_expense_tracker/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart'; // Import the provider package

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  await initHive();
  // Call initHive before HiveService.initHive()
  await HiveService.initHive();
  runApp(const MyApp());
}

Future<void> initHive() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(ExpenseAdapter()); // Register the ExpenseAdapter
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // MultiProvider as the parent of all widgets
      providers: [
        ChangeNotifierProvider(
          create: (context) => Authprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ExpenseProvider(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            title: 'Cipherex',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // tested with just a hot reload.
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: Splash(),
          );
        },
      ),
    );
  }
}
