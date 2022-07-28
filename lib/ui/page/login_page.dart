import 'package:flutter/material.dart';
import 'package:ptsl/ui/theme/colors.dart';
import 'package:ptsl/ui/theme/text_styles.dart';
import 'package:ptsl/ui/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoagiPageState();
}

class _LoagiPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: bodyLogin(context),
    );
  }

  Widget bodyLogin(context) {
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: height / 4.5),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pokedex',
              style: AppTextStyle.headline1,
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  emailTextField(email),
                  const SizedBox(height: 20),
                  passwordTextField(password),
                ],
              ),
            ),
            button(context, 'Iniciar sesión', 'home')
          ],
        ),
      ],
    );
  }

  Widget button(context, titulo, page) {
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColors.primaryColor,
        visualDensity: VisualDensity.comfortable,
        elevation: 10,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        onPrimary: AppColors.secondaryColor,
        minimumSize: Size(width * 0.7, 50),
        maximumSize: Size(width * 0.7, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      child: Text(
        titulo,
        style: AppTextStyle.textTheme.headline3,
      ),
      onPressed: () {
        addStringToSF();
        Navigator.pushNamed(context, page);
      },
    );
  }

  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email.text);
    prefs.setString('password', password.text);
  }
}
