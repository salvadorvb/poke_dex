import 'package:poke_dex/app/error/failure.dart';
import 'package:poke_dex/app/utils/either.dart';
import 'package:poke_dex/data/model/pokemon.dart';
import 'package:poke_dex/data/pokemon_remote_api.dart';

class PokemonRepository {
  final IPokedexRemoteApi pokemonRemoteApi;
  PokemonRepository(this.pokemonRemoteApi);

  Future<Either<Failure, List<Pokemon>>> getAllPokemon(int offset) =>
      runGuard(() async {
        final pokemonList = await pokemonRemoteApi.getAllPokemon(offset);
        // we might want to cache some data here
        return pokemonList;
      });

  Future<Either<Failure, Pokemon>> getPokemon(int id) => runGuard(() async {
    final pokemon = await pokemonRemoteApi.getPokemon(id);
    return pokemon;
  });
}