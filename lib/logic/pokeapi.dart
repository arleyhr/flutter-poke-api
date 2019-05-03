import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:pokedex/config.dart';
import 'package:kt_dart/collection.dart';
import 'package:pokedex/logic/models/pokedetail.dart';

import 'package:pokedex/logic/models/pokemon.dart';

class PokeAPI {
  PokeAPI();

  Client _client = Client();

  static final String baseUrl = poke_api_base;

  Uri pokemonListUri () {
    return Uri.https(pokemon_authority, '$poke_api_base/pokemon');
  }

  Uri pokemonDetailUri (pokemonName) {
    return Uri.https(pokemon_authority, '$poke_api_base/pokemon/$pokemonName');
  }

  Future<KtList<Pokemon>> getPokemonList([int offset = 0]) async {
    final perPage = 20;
    final Response response = await _client.get('${pokemonListUri()}?offset=${offset}&limit=$perPage');
    final decoded = jsonDecode(response.body);
    final results = decoded['results'];

    return listFrom(results).map((item) => Pokemon.fromJson(item));
  }

  Future<PokeDetail> getPokemonDetail([String pokemonName = 'pikachu']) async {
    final Response response = await _client.get(pokemonDetailUri(pokemonName));
    final decoded = jsonDecode(response.body);
    return PokeDetail.fromJson(decoded);
  }

}

final pokeApi = new PokeAPI();
