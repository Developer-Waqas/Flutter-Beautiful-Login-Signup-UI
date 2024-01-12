import 'package:flutter/material.dart';

import 'screens/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SignIn/SignUp UI',
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
