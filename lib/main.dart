import 'package:poke_dex/app/config/constants.dart';
import 'package:poke_dex/app/app.dart';
import 'package:poke_dex/app/manager/http_manager.dart';
import 'package:poke_dex/data/model/pokemon.dart';
import 'package:poke_dex/data/pokemon_local_storage.dart';
import 'package:poke_dex/data/pokemon_remote_api.dart';
import 'package:poke_dex/repository/favourite_pokemon_repository.dart';
import 'package:poke_dex/repository/pokemon_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PokemonAdapter());
  Hive.registerAdapter(PokemonNameAndUrlDatumAdapter());
  Hive.registerAdapter(PokemonStatAdapter());
  Hive.registerAdapter(PokemonTypeAdapter());

  final favouriteDb = await Hive.openBox<Pokemon>(LocalDbKeys.favouriteDb);
  final dio = Dio();
  final http = HttpManager(dio: dio);

  final pokemonRepository = PokemonRepository(
    PokedexRemoteApi(http),
  );

  final favouritePokemonRepository = FavouritePokemonRepository(
    PokedexLocalStorage(favouriteDb),
  );

  runApp(
    PokedexApp(
      pokemonRepository: pokemonRepository,
      favouritePokemonRepository: favouritePokemonRepository,
    ),
  );
}
