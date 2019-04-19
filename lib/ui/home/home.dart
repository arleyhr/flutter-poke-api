import 'package:flutter/material.dart';
import 'package:pokedex/logic/pokeapi.dart';
import 'package:pokedex/logic/models/pokemon.dart';
import 'package:kt_dart/collection.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  KtList<Pokemon> _pokemonList = emptyList();

  @override
  void initState() {
    super.initState();
    getPokemonList();
  }
  getPokemonList () async {
    final pokemonList = await pokeApi.getPokemonList();
    setState(() {
      _pokemonList = pokemonList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _pokemonList.size,
        itemBuilder: (ctx, index) {
          var item = _pokemonList[index];
          return ListTile(
            title: Text(item.name),
          );
        },
      )
    );
  }
}