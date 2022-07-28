import 'package:flutter/material.dart';
import 'package:ptsl/ui/theme/colors.dart';
import 'package:ptsl/ui/theme/text_styles.dart';
import 'package:ptsl/ui/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  initState() {
    getStringValuesSF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var separation = const SizedBox(height: 20);
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                title('Usuario'),
                separation,
                contents(user.text),
                separation,
                title('Correo Electronico'),
                separation,
                contents(email.text),
                separation,
                title('Contraseña'),
                separation,
                contents(password.text),
                separation,
              ],
            ),
          ),
          updateProfile(),
          deleteProfile(),
          creatProfile(),
        ],
      ),
    );
  }

  Widget title(String title) {
    return Text(
      title,
      style: AppTextStyle.textTheme.headline3,
    );
  }

  Widget contents(String contents) {
    return Text(
      contents,
      style: AppTextStyle.textTheme.headline3,
    );
  }

  Widget updateProfile() {
    var height = MediaQuery.of(context).size.height;
    return Positioned(
      bottom: 10,
      right: 60,
      child: IconButton(
        color: AppColors.secondaryColor,
        iconSize: 30,
        onPressed: () {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ListView(
                children: [
                  AlertDialog(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    backgroundColor: AppColors.secondaryColor,
                    title: Text(
                      'Editar cuenta',
                      style: AppTextStyle.textTheme.headline5,
                    ),
                    content: Container(
                      height: height * 0.5,
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: const BorderRadius.all(Radius.circular(25)),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          userTextField(user),
                          const SizedBox(height: 20),
                          emailTextField(email),
                          const SizedBox(height: 20),
                          passwordTextField(password),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                          child: Text("Aceptar", style: AppTextStyle.textTheme.headline6),
                          onPressed: () {
                            updateStringToSF();
                            Navigator.of(context).pop();
                            setState(() {});
                          }),
                      TextButton(
                          child: Text("Cancelar", style: AppTextStyle.textTheme.headline6),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ],
                  ),
                ],
              );
            },
          );
        },
        icon: const Icon(Icons.edit_note_sharp),
      ),
    );
  }

  Widget deleteProfile() {
    return Positioned(
      bottom: 10,
      right: 30,
      child: IconButton(
        color: AppColors.secondaryColor,
        iconSize: 30,
        onPressed: () {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                backgroundColor: AppColors.secondaryColor,
                title: Text(
                  'Eliminar cuenta',
                  style: AppTextStyle.textTheme.headline5,
                ),
                content: Text("¿Desea eliminar cuenta?", style: AppTextStyle.textTheme.headline5),
                actions: <Widget>[
                  TextButton(
                      child: Text("Aceptar", style: AppTextStyle.textTheme.headline6),
                      onPressed: () {
                        deleteStringToSF();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      }),
                  TextButton(
                      child: Text("Cancelar", style: AppTextStyle.textTheme.headline6),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              );
            },
          );
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }

  Widget creatProfile() {
    var height = MediaQuery.of(context).size.height;
    return Positioned(
      bottom: 10,
      right: 0,
      child: IconButton(
        color: AppColors.secondaryColor,
        iconSize: 30,
        onPressed: () {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ListView(
                children: [
                  AlertDialog(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    backgroundColor: AppColors.secondaryColor,
                    title: Text(
                      'Crear cuenta',
                      style: AppTextStyle.textTheme.headline5,
                    ),
                    content: Container(
                      height: height * 0.5,
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: const BorderRadius.all(Radius.circular(25)),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          userTextField(user),
                          const SizedBox(height: 20),
                          emailTextField(email),
                          const SizedBox(height: 20),
                          passwordTextField(password),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                          child: Text("Aceptar", style: AppTextStyle.textTheme.headline6),
                          onPressed: () {
                            updateStringToSF();
                            Navigator.of(context).pop();
                            setState(() {});
                          }),
                      TextButton(
                          child: Text("Cancelar", style: AppTextStyle.textTheme.headline6),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ],
                  ),
                ],
              );
            },
          );
        },
        icon: const Icon(Icons.create_sharp),
      ),
    );
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email.text = prefs.getString('email')!;
      password.text = prefs.getString('password')!;
    });
  }

  deleteStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', '');
    prefs.setString('email', '');
    prefs.setString('password', '');
  }

  updateStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', user.text);
    prefs.setString('email', email.text);
    prefs.setString('password', password.text);
  }
}