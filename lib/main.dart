import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:personavey/setups/setup_bottom_sheet_ui.dart';
import 'package:personavey/setups/setup_dialog_ui.dart';
import 'app/app_setup.locator.dart';
import 'app/app_setup.router.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  setupBottomSheetUi();
  // setupSnackbarUi();
  setupDialogUi();
  runApp(const MyApp(),);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.tealAccent,
        backgroundColor: Colors.teal,
        buttonColor: Colors.teal
      ),
      debugShowCheckedModeBanner: false,
        navigatorKey: StackedService.navigatorKey,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
