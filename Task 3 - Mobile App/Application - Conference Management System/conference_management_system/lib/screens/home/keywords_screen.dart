import 'package:flutter/material.dart';

class KeywordsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keywords'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Keywords Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
