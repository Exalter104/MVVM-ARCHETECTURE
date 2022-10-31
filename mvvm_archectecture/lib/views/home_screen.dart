import 'package:flutter/material.dart';
import 'package:mvvm_archectecture/utils/routess/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RoutesNames.login);
          },
          child: Text("Login"),
        ),
      ),
    );
  }
}
