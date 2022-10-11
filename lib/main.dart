import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/firebase_options.dart';
import 'package:firebase_crud/pages/add_student_page.dart';
import 'package:firebase_crud/pages/home_page.dart';
import 'package:firebase_crud/pages/update_student_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Crud',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: {
        'home':(context) => HomePage(),
        'addStudent':(context) => AddStudentPage(),
        'updateStudent':(context) => UpdateStudentPage(),
      },
      // home: HomePage(),
    );
  }
}
