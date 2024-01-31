import 'package:poke_dex/app/config/constants.dart';
import 'package:poke_dex/app/config/theme.dart';
import 'package:poke_dex/modules/app_scaffold.dart';
import 'package:poke_dex/modules/bloc/favourite_pokemom_cubit.dart';
import 'package:poke_dex/modules/bloc/pokemon_cubit.dart';
import 'package:poke_dex/repository/favourite_pokemon_repository.dart';
import 'package:poke_dex/repository/pokemon_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexApp extends StatelessWidget {
  final PokemonRepository pokemonRepository;
  final FavouritePokemonRepository favouritePokemonRepository;

  const PokedexApp({
    required this.pokemonRepository,
    required this.favouritePokemonRepository,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonCubit>(
          create: (context) => PokemonCubit(
            pokemonRepository: pokemonRepository,
          )..getPokemons(),
        ),
        BlocProvider<FavouritePokemonCubit>(
          create: (context) => FavouritePokemonCubit(
            pokemonRepository: favouritePokemonRepository,
          )..getFavouritePokemons(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kAppName,
        theme: lightThemeData,
        home: const AppScaffoldPage(),
      ),
    );
  }
}
