import 'package:conference_management_system/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  // Constructer
  final Function toggleView;
  SignIn({required this.toggleView});

  // const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

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
          title: const Text('Sign in to the system'),
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text("Register"),
              onPressed: () async {
                widget.toggleView();
              },
            )
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
                validator: (val) =>
                    val!.length < 6 ? 'Minimum 6 characters' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => {password = val});
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);
                    setState(() =>
                        error = 'could not sign in with those credentials');
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue[200]),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white), // Set the text color to white
                ),
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
