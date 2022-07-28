import 'package:flutter/material.dart';
import 'package:ptsl/ui/theme/colors.dart';
import 'package:ptsl/ui/theme/text_styles.dart';

Widget userTextField(user) {
  return TextField(
    controller: user,
    style: AppTextStyle.textTheme.headline3,
    keyboardType: TextInputType.name,
    decoration: InputDecoration(
      labelStyle: AppTextStyle.textTheme.headline3,
      hintStyle: AppTextStyle.textTheme.headline3,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      hintText: 'Usuario',
      labelText: 'Usuario',
      suffixIcon: const Icon(
        Icons.account_circle_rounded,
        color: AppColors.iconColor,
      ),
    ),
  );
}

Widget emailTextField(email) {
  return TextField(
    controller: email,
    style: AppTextStyle.textTheme.headline3,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelStyle: AppTextStyle.textTheme.headline3,
      hintStyle: AppTextStyle.textTheme.headline3,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      hintText: 'Correo electrónico',
      labelText: 'Correo electrónico',
      suffixIcon: const Icon(
        Icons.perm_contact_calendar_outlined,
        color: AppColors.iconColor,
      ),
    ),
  );
}

Widget passwordTextField(password) {
  return TextField(
    controller: password,
    obscureText: true,
    obscuringCharacter: "*",
    //autofocus: true,
    textCapitalization: TextCapitalization.sentences,
    style: AppTextStyle.textTheme.headline3,
    decoration: InputDecoration(
      labelStyle: AppTextStyle.textTheme.headline3,
      hintStyle: AppTextStyle.textTheme.headline3,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      labelText: 'Contraseña',
      hintText: 'Contraseña',
      //filled: true,
      suffixIcon: const Icon(
        Icons.password_sharp,
        color: AppColors.iconColor,
      ),
    ),
  );
}
