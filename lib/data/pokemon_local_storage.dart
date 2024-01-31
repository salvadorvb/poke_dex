import 'dart:async';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poke_dex/data/model/pokemon.dart';
import 'package:poke_dex/app/error/exception.dart';


abstract class IPokedexLocalStorage {
  Stream<List<Pokemon>> watchAllPokemon();
  Future<void> savePokemon(Pokemon pokemon);
  Future<void> deletePokemon(int id);
}

class PokedexLocalStorage implements IPokedexLocalStorage {
  final Box<Pokemon> box;

  PokedexLocalStorage(this.box) {
    if (!box.isOpen) {
      throw CacheGetException("Box is not open");
    }
  }

  @override
  Stream<List<Pokemon>> watchAllPokemon() => box.watch().map((_) => box.values.toList());

  @override
  Future<void> savePokemon(Pokemon pokemon) async {
    try {
      await box.put(pokemon.id, pokemon);
    } catch (e) {
      throw CachePutException(e.toString());
    }
  }

  @override
  Future<void> deletePokemon(int id) async {
    try {
      await box.delete(id);
    } catch (e) {
      throw CachePutException(e.toString());
    }
  }
}
