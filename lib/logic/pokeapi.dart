import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:pokedex/config.dart';
import 'package:kt_dart/collection.dart';

import 'package:pokedex/logic/models/pokemon.dart';

class PokeAPI {
  PokeAPI();

  Client _client = Client();

  static final String baseUrl = poke_api_base;
  Uri get pokemonListUri => Uri.https(pokemon_authority, '$poke_api_base/pokemon');

  Future<KtList<Pokemon>> getPokemonList() async {
    final Response response = await _client.get(pokemonListUri);
    final decoded = jsonDecode(response.body);
    final results = decoded['results'];

    return listFrom(results).map((item) => Pokemon.fromJson(item));
  }

}

final pokeApi = new PokeAPI();
