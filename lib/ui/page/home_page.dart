import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    getStringValuesSF();
    super.initState();
    // Add listeners to this class
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home")),
    );
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');
    print(email);
    print(password);

    return;
  }
}
