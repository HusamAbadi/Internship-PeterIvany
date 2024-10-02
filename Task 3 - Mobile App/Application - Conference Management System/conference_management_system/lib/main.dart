import 'package:conference_management_system/screens/wrapper.dart';
import 'package:conference_management_system/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:conference_management_system/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthService().userStream,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
        // Now we can use the AppUser Data whenever we get some within the Wrapper widget and all which bellow it
      ),
    );
  }
}
