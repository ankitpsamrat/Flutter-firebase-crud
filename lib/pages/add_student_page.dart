import 'package:firebase_crud/common/widgets/button_widget.dart';
import 'package:firebase_crud/common/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  //  form key

  final _formKey = GlobalKey<FormState>();

  //  editing controller

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var name = "";
  var email = "";
  var password = "";

  //  add user method

  addUser() {
    print('user added');
  }

  //  clear input text field method

  clearText() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  //  Clean up the controller when the widget is disposed

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Student'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  inputController: nameController,
                  textInputAction: TextInputAction.next,
                  formValidator: (value) {
                    RegExp regex = RegExp(r'^.{3,}$');
                    if (value!.isEmpty) {
                      return ("Name cannot be Empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid name(Min. 3 Character)");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    nameController.text = value!;
                  },
                  icon: Icons.person,
                  textName: 'Name',
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  inputController: emailController,
                  textInputAction: TextInputAction.next,
                  formValidator: (value) {
                    if (value!.isEmpty) {
                      return ("Please enter your email");
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please enter a valid email");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    emailController.text = value!;
                  },
                  icon: Icons.mail,
                  textName: 'Email',
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  inputController: passwordController,
                  textInputAction: TextInputAction.done,
                  toHide: true,
                  formValidator: (value) {
                    RegExp regex = RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return ("Password is required for login");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid Password(Min. 6 Character)");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    passwordController.text = value!;
                  },
                  icon: Icons.lock,
                  textName: 'Password',
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    btnName: 'Register',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          name = nameController.text;
                          email = emailController.text;
                          password = passwordController.text;
                          addUser();
                          clearText();
                        });
                      }
                    },
                  ),
                  Button(
                    btnName: 'Reset',
                    onPressed: () {
                      clearText();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
