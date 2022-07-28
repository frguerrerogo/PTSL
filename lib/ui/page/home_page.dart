import 'package:flutter/material.dart';
import 'package:ptsl/ui/page/pokedex_page.dart';
import 'package:ptsl/ui/page/profile_page.dart';
import 'package:ptsl/ui/theme/colors.dart';
import 'package:ptsl/ui/theme/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final page = [const ProfilePage(), PokedexPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: page[_selectedIndex],
      bottomNavigationBar: footer(),
    );
  }

  header() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      titleTextStyle: AppTextStyle.textTheme.headline2,
      title: (_selectedIndex == 0
          ? const Text(
              "Perfil",
            )
          : _selectedIndex == 1
              ? const Text(
                  "Pokedex",
                )
              : const Text("")),
      backgroundColor: AppColors.primaryColor,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      actions: <Widget>[
        PopupMenuButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          color: AppColors.secondaryColor,
          icon: const Icon(
            Icons.menu,
            color: AppColors.secondaryColor,
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              onTap: () {
                Navigator.pop(context);
              },
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Cerrar Sesión",
                    style: AppTextStyle.headline5,
                  ),
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.output_rounded,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  footer() {
    return BottomNavigationBar(
      backgroundColor: AppColors.primaryColor,
      selectedLabelStyle: AppTextStyle.textTheme.headline3,
      unselectedLabelStyle: AppTextStyle.textTheme.headline4,
      elevation: 10,
      iconSize: 25,
      unselectedItemColor: AppColors.iconColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded),
          label: 'Perfil',
          backgroundColor: AppColors.secondaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bento_rounded),
          label: 'Pokedex',
          backgroundColor: AppColors.secondaryColor,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: AppColors.secondaryColor,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
