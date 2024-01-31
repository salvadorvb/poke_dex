import 'package:poke_dex/app/error/failure.dart';
import 'package:poke_dex/app/utils/either.dart';
import 'package:poke_dex/data/model/pokemon.dart';
import 'package:poke_dex/data/pokemon_local_storage.dart';


class FavouritePokemonRepository {
  final IPokedexLocalStorage pokedexLocalStorage;
  FavouritePokemonRepository(this.pokedexLocalStorage);

  Stream<Either<Failure, List<Pokemon>>> getAllPokemon() async* {
    yield* runSGuard(() => pokedexLocalStorage.watchAllPokemon());
  }

  Future<Either<Failure, void>> savePokemon(Pokemon pokemon) =>
      runGuard(() async {
        await pokedexLocalStorage.savePokemon(pokemon);
        return;
      });

  Future<Either<Failure, void>> deletePokemon(int id) => runGuard(() async {
    await pokedexLocalStorage.deletePokemon(id);
    return;
  });
}

