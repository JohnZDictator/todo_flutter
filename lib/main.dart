import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:todo/feature/authentication/view/signin.dart';
import 'package:todo/feature/authentication/view/signup.dart';
import 'package:todo/feature/todo_details/view/todo_details.dart';
import 'package:todo/feature/todo_home/view/todo_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo App',
      home: user == null ? SigninPage() : TodoHomePage(),
      getPages: [
        GetPage(name: '/home', page: () => TodoHomePage()),
        GetPage(name: '/signin', page: () => SigninPage()),
        GetPage(name: '/signup', page: () => SignupPage()),
        GetPage(name: '/details', page: () => TodoDetailsPage()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
