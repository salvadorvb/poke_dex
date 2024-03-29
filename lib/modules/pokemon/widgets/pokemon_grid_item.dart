import 'package:poke_dex/app/config/constants.dart';
import 'package:poke_dex/app/config/theme.dart';
import 'package:poke_dex/app/utils/extension/context.dart';
import 'package:poke_dex/app/utils/extension/string.dart';
import 'package:poke_dex/data/model/pokemon.dart';
import 'package:poke_dex/app/widgets/image.dart';
import 'package:poke_dex/modules/pokemon_info/pokemon_info.dart';
import 'package:flutter/material.dart';

class PokemonGridItem extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonGridItem(this.pokemon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(PokemonInfoPage(pokemon)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Insets.md),
          color: Colors.blueGrey,
        ),
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Hero(
              tag: ValueKey(pokemon.id),
              child: HostedImage(
                pokemon.imageUrl,
                height: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Insets.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    pokemon.pokedexId,
                    style: const TextStyle(
                      color: AppColors.textBodyColor,
                    ),
                  ),
                  Text(
                    pokemon.name.capitalize(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
