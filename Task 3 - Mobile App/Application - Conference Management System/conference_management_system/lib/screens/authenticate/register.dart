import 'package:conference_management_system/services/auth.dart';
import 'package:conference_management_system/shared/constants.dart';
import 'package:conference_management_system/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  // Constructor
  final Function toggleView;
  Register({required this.toggleView});

  // Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<
      FormState>(); //* we wil use this global key To identify, track the state and validate our form
  bool loading = false;

  //* text field state
  String email = '';
  String password = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.amber[100],
            appBar: AppBar(
                backgroundColor: Colors.amber[400],
                elevation: 0.0,
                title: const Text('Sign up to the system'),
                actions: <Widget>[
                  TextButton.icon(
                    icon: const Icon(Icons.person),
                    label: const Text("Sign In"),
                    onPressed: () async {
                      widget.toggleView();
                    },
                  ),
                ]),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => {email = val});
                        }),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      obscureText: true,
                      validator: (val) =>
                          val!.length < 6 ? 'Minimum 6 characters' : null,
                      onChanged: (val) {
                        setState(() => {password = val});
                      },
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue[200]),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.white), // Set the text color to white
                      ),
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'please supply a vaild email';
                              loading = false;
                            });
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      error,
                      style: const TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
