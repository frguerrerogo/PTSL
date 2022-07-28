import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  initState() {
    getStringValuesSF();
    super.initState();
    // Add listeners to this class
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("profile")),
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
