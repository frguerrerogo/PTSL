import 'package:flutter/material.dart';
import 'package:ptsl/ui/page/home_page.dart';
import 'package:ptsl/ui/page/login_page.dart';
import 'package:ptsl/ui/page/profile_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => const LoginPage(),
    'home': (BuildContext context) => const HomePage(),
    'profile': (BuildContext context) => const ProfilePage(),
  };
}
