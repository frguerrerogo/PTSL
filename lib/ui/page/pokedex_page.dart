import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ptsl/ui/page/pokemon_detail_page.dart';
import 'package:ptsl/ui/theme/colors.dart';
import 'package:ptsl/ui/theme/text_styles.dart';
import 'package:http/http.dart' as http;

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  var pokeApi = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  List? pokedex;

  @override
  void initState() {
    super.initState();
    fetctPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          pokedex != null
              ? Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      border: Border.all(color: Colors.white60, width: 4),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 2.733,
                      ),
                      itemCount: pokedex!.length,
                      itemBuilder: (context, index) {
                        var type = pokedex![index]['type'][0];
                        return InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 15,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white60, width: 3),
                                color: type == 'Grass'
                                    ? Colors.green.shade300
                                    : type == 'Fire'
                                        ? Colors.red.shade300
                                        : type == 'Water'
                                            ? Colors.blue.shade300
                                            : type == 'Electric'
                                                ? Colors.yellow.shade300
                                                : type == 'Rock'
                                                    ? Colors.grey.shade400
                                                    : type == 'Ground'
                                                        ? Colors.brown.shade300
                                                        : type == 'Psychic'
                                                            ? Colors.pink.shade200
                                                            : type == 'Fighting'
                                                                ? Colors.orange.shade200
                                                                : type == 'Bug'
                                                                    ? Colors.lightGreen.shade300
                                                                    : type == 'Ghost'
                                                                        ? Colors.deepPurple.shade300
                                                                        : type == 'Normal'
                                                                            ? Colors.grey.shade400
                                                                            : type == 'Poison'
                                                                                ? Colors.deepPurple.shade200
                                                                                : type == 'Ice'
                                                                                    ? Colors.lightBlue.shade200
                                                                                    : type == 'Dragon'
                                                                                        ? Colors.teal.shade200
                                                                                        : Colors.redAccent,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: -25,
                                    right: -15,
                                    child: Image.asset(
                                      'assets/images/pokeball.png',
                                      height: 150,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    left: 30,
                                    child: Text(pokedex![index]['name'], style: AppTextStyle.headline3),
                                  ),
                                  Positioned(
                                    top: 60,
                                    left: 60,
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4, bottom: 4),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: Colors.black26,
                                      ),
                                      child: Text(
                                        type.toString(),
                                        style: AppTextStyle.headline4,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 45,
                                    child: CachedNetworkImage(
                                      imageUrl: pokedex![index]['img'],
                                      height: 130,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PokemonDetailPage(
                                  pokemonDetail: pokedex![index],
                                  color: type == 'Grass'
                                      ? Colors.green.shade300
                                      : type == 'Fire'
                                          ? Colors.red.shade300
                                          : type == 'Water'
                                              ? Colors.blue.shade300
                                              : type == 'Electric'
                                                  ? Colors.yellow.shade300
                                                  : type == 'Rock'
                                                      ? Colors.grey.shade400
                                                      : type == 'Ground'
                                                          ? Colors.brown.shade300
                                                          : type == 'Psychic'
                                                              ? Colors.pink.shade200
                                                              : type == 'Fighting'
                                                                  ? Colors.orange.shade200
                                                                  : type == 'Bug'
                                                                      ? Colors.lightGreen.shade300
                                                                      : type == 'Ghost'
                                                                          ? Colors.deepPurple.shade300
                                                                          : type == 'Normal'
                                                                              ? Colors.grey.shade400
                                                                              : type == 'Poison'
                                                                                  ? Colors.deepPurple.shade200
                                                                                  : type == 'Ice'
                                                                                      ? Colors.lightBlue.shade200
                                                                                      : type == 'Dragon'
                                                                                          ? Colors.teal.shade200
                                                                                          : Colors.redAccent,
                                  heroTag: index,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    color: AppColors.primaryColor,
                  ),
                ),
        ],
      ),
    );
  }

  Future fetctPokemonData() async {
    var url = Uri.https('raw.githubusercontent.com', 'Biuni/PokemonGO-Pokedex/master/pokedex.json');
    print(url);
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        setState(() {
          var decodedJsonData = jsonDecode(value.body);
          pokedex = decodedJsonData['pokemon'];
        });
      } else {
        throw Exception('Fallo la conexión ${value.statusCode}');
      }
    });
  }
}
