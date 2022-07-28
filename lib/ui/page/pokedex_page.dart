import 'package:flutter/material.dart';

class PokedexPage extends StatefulWidget {
  PokedexPage({Key? key}) : super(key: key);

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("pokedex")),
    );
  }
}
