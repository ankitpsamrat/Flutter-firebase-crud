import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('students').snapshots();

  //  delete user method

  deleteUser() {
    print('user deleted');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: studentsStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          print('Somthing went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        //  retrive data from database

        final List storedocs = [];
        snapshot.data.docs.map((DocumentSnapshot document) {
          Map a = document.data() as Map<String, dynamic>;
          storedocs.add(a);
        }).toList();

        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical, //
            child: Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                1: FixedColumnWidth(140),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        color: Colors.greenAccent,
                        child: Center(
                          child: Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: Colors.greenAccent,
                        child: Center(
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: Colors.greenAccent,
                        child: Center(
                          child: Text(
                            'Action',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                for (var i = 0; i < storedocs.length; i++) ...[
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(
                          child: Text(
                            storedocs[i]['name'],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(
                            storedocs[i]['email'],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'updateStudent');
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.orange,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                print(storedocs);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
