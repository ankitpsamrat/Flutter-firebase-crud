import 'package:firebase_crud/common/widgets/delete_dailog.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/pages/update_student_page.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('students').snapshots();

  //  delete user method

  CollectionReference students =
      FirebaseFirestore.instance.collection('students');

  Future<void> deleteUser(id) {
    return students
        .doc(id)
        .delete()
        .then((value) => debugPrint('User deleted'))
        .catchError((error) => debugPrint('Failed to delete : $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: studentsStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          debugPrint('Somthing went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        //  retrive data from database

        final List storedocs = [];
        snapshot.data.docs.map((DocumentSnapshot document) {
          Map a = document.data() as Map<String, dynamic>;
          storedocs.add(a);
          a['id'] = document.id;
        }).toList();

        return ListView.builder(
          itemCount: storedocs.length,
          itemBuilder: (BuildContext context, int index) {
            final docs = storedocs[index];

            return Card(
              color: const Color.fromARGB(255, 206, 230, 246),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                title: Text(
                  docs['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  docs['email'],
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                contentPadding: const EdgeInsets.only(left: 15),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateStudentPage(
                              id: docs['id'],
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // deleteUser(docs['id']);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return DeleteDailog(
                              deleteBtnOnTap: () {
                                deleteUser(docs['id']);
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
