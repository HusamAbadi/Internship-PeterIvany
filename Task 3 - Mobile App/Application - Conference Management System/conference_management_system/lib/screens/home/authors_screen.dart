import 'package:flutter/material.dart';

class AuthorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authors'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Authors Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}