import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber[100],
        child: const Center(
          child: SpinKitWave(
            color: Colors.amber,
            size: 50.0,
          ),
        ));
  }
}