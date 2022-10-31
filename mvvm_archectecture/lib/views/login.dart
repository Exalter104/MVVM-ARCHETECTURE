import 'package:flutter/material.dart';

import '../utils/routess/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RoutesNames.home);
          },
          child: Text("Home"),
        ),
      ),
    );
  }
}
