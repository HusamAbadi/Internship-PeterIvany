import 'package:conference_management_system/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
      // home: Scaffold(
      //   backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      //   body: SafeArea(
      //     child: Center(
      //       child: Column(
      //         mainAxisAlignment:
      //             MainAxisAlignment.center, // Center the Column vertically
      //         children: [
      //           const Text(
      //             "Conferences Management System",
      //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      //           ),
      //           const SizedBox(height: 10),
      //           const Text(
      //             "Welcome Back!",
      //             style: TextStyle(fontSize: 20),
      //           ),
      //           const SizedBox(height: 30), // Space between text and buttons
      //           Column(
      //             children: [
      //               SizedBox(
      //                 width: 200, // Set uniform width for all buttons
      //                 child: ElevatedButton(
      //                   onPressed: () {},
      //                   child: const Text("Conferences"),
      //                 ),
      //               ),
      //               const SizedBox(height: 10),
      //               SizedBox(
      //                 width: 200,
      //                 child: ElevatedButton(
      //                   onPressed: () {},
      //                   child: const Text("Authors"),
      //                 ),
      //               ),
      //               const SizedBox(height: 10),
      //               SizedBox(
      //                 width: 200,
      //                 child: ElevatedButton(
      //                   onPressed: () {},
      //                   child: const Text("Keywords"),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
