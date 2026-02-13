import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/common/widgets/button_widget.dart';

class UpdateStudentPage extends StatefulWidget {
  const UpdateStudentPage({super.key, required this.id});

  final String id;

  @override
  State<UpdateStudentPage> createState() => _UpdateStudentPageState();
}

class _UpdateStudentPageState extends State<UpdateStudentPage> {
  //  form key

  final _formKey = GlobalKey<FormState>();

  //  update user method

  CollectionReference students = FirebaseFirestore.instance.collection(
    'students',
  );

  Future<void> updateUser(id, name, email, password) {
    return students
        .doc(id)
        .update({'name': name, 'email': email, 'password': password})
        .then((value) => debugPrint('User updated'))
        .catchError((error) => debugPrint('Failed to update : $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Student'), elevation: 0),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,

          //   retriving data by specific id
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('students')
                .doc(widget.id)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                debugPrint('Something Went Wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              var data = snapshot.data!.data();
              var name = data!['name'];
              var email = data['email'];
              var password = data['password'];
              return Column(
                children: [
                  const SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      initialValue: name,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => {name = value},
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person, size: 20),
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{3,}$');
                        if (value!.isEmpty) {
                          return ("Name cannot be Empty");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid name(Min. 3 Character)");
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      initialValue: email,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => {email = value},
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail, size: 20),
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please enter your email");
                        }
                        if (!RegExp(
                          r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(value)) {
                          return ("Please enter a valid email");
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      initialValue: password,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      onChanged: (value) => {password = value},
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock, size: 20),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return ("Password is required for login");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Password(Min. 6 Character)");
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        btnName: 'Cancel',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Button(
                        btnName: 'Update',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              updateUser(widget.id, name, email, password);
                              Navigator.pop(context);
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
