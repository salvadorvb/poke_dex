import 'package:poke_dex/app/config/constants.dart';
import 'package:poke_dex/data/model/pokemon.dart';
import 'package:poke_dex/modules/bloc/favourite_pokemom_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingButton extends StatelessWidget {
  final bool isPokemonMarkedAsFavourite;
  final Pokemon pokemon;
  const FloatingButton(
      this.pokemon, {
        this.isPokemonMarkedAsFavourite = false,
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (isPokemonMarkedAsFavourite) {
          context.read<FavouritePokemonCubit>().removePokemon(pokemon.id);
        } else {
          context.read<FavouritePokemonCubit>().addPokemon(pokemon);
        }
      },
      backgroundColor: isPokemonMarkedAsFavourite ? const Color(0xff48C9B0) : AppColors.primaryColor,
      // Usando un icono de corazón como child del botón
      child: Icon(
        isPokemonMarkedAsFavourite ? Icons.favorite : Icons.favorite_border,
        color: Colors.white, // Asegúrate de que el icono sea visible contra el color de fondo
      ),
    );
  }

}
