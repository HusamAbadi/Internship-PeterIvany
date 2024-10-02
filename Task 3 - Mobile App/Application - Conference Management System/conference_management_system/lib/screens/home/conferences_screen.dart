import 'package:flutter/material.dart';

class ConferencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conferences'),
      ),
      body: const Center(
        child: Text(
          'Welcome to Conferences',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
