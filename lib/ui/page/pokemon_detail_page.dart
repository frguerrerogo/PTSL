import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ptsl/ui/theme/colors.dart';
import 'package:ptsl/ui/theme/text_styles.dart';

class PokemonDetailPage extends StatelessWidget {
  final pokemonDetail;
  final Color color;
  final int heroTag;

  const PokemonDetailPage({Key? key, required this.pokemonDetail, required this.color, required this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.primaryColor,
                size: 30,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: Text(pokemonDetail['name'], style: AppTextStyle.headline2),
          ),
          Positioned(
            top: 160,
            left: 20,
            child: Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.black26,
              ),
              child: Text(
                pokemonDetail['type'].join(', '),
                style: AppTextStyle.headline4,
              ),
            ),
          ),
          Positioned(
            top: height * 0.18,
            right: -10,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: const BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    pokemonDetails('Nombre', 'name', width),
                    pokemonDetails('Altura', 'height', width),
                    pokemonDetails('Peso', 'weight', width),
                    pokemonDetails('Tiempo de generación', 'spawn_time', width),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.4,
                            child: Text(
                              'Debilidades',
                              style: AppTextStyle.headline5,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.4,
                            child: Text(
                              pokemonDetail['weaknesses'].join(', '),
                              style: AppTextStyle.headline5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (height * 0.16),
            left: (width / 2) - 60,
            child: CachedNetworkImage(
              imageUrl: pokemonDetail['img'],
              height: 220,
              fit: BoxFit.fitHeight,
            ),
          )
        ],
      ),
    );
  }

  Widget pokemonDetails(title, component, width) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 0.4,
            child: Text(
              title,
              style: AppTextStyle.headline5,
            ),
          ),
          SizedBox(
            width: width * 0.4,
            child: Text(
              pokemonDetail[component],
              style: AppTextStyle.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
