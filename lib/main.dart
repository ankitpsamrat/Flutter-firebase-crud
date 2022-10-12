import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/firebase_options.dart';
import 'package:firebase_crud/pages/add_student_page.dart';
import 'package:firebase_crud/pages/home_page.dart';
import 'package:firebase_crud/pages/update_student_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Something went Wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Firebase Crud',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: 'home',
            routes: {
              'home': (context) => HomePage(),
              'addStudent': (context) => AddStudentPage(),
              'updateStudent': (context) => UpdateStudentPage(),
            },
            // home: HomePage(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
