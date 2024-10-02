import 'package:conference_management_system/services/auth.dart';
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
      FormState>(); //we wil use this global key To identify, track the state and validate our form

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
          backgroundColor: Colors.amber[400],
          elevation: 0.0,
          title: const Text('Sign up to the system'),
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text("Sign In"),
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
              SizedBox(height: 20.0),
              TextFormField(
                  validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => {email = val});
                  }),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                validator: (val) =>
                    val!.length < 6 ? 'Minimum 6 characters' : null,
                onChanged: (val) {
                  setState(() => {password = val});
                },
              ),
              SizedBox(height: 20.0),
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
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() => error = 'please supply a vaild email');
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
