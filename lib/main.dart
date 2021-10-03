
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'helper/sharepref.dart';
import 'view/login/login.dart';
import 'view/login/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPref.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
 // final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // print(_auth.currentUser?.displayName);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => SignupPage(),
        '/home': (BuildContext context) => HomePage(),
        '/login': (BuildContext context) => Login()
      },
      home:AppSharedPref.getUser()!=null?HomePage(): Login(),
    );
  }
}
