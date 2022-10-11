import 'package:firebase_crud/pages/add_student_page.dart';
import 'package:firebase_crud/pages/list_student_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Firebase Crud'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'addStudent');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
      body: StudentListPage(),
    );
  }
}
