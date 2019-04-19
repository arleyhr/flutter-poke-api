import 'package:flutter/material.dart';
import 'dart:math';
import 'package:pokedex/logic/pokeapi.dart';
import 'package:pokedex/logic/models/pokemon.dart';
import 'package:kt_dart/collection.dart';
import 'package:pokedex/config.dart';
import 'package:pokedex/ui/widgets/pokemon_card.dart';


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

  _generatePokemonItems () {
    final colors = [
      Colors.amber,
      Colors.blueAccent,
      Colors.greenAccent,
      Colors.redAccent,
      Colors.orangeAccent,
      Colors.black,
      Colors.lime,
      Colors.teal,
      Colors.lightGreen,
      Colors.purpleAccent,
      Colors.blue,
      Colors.amberAccent,
      Colors.yellowAccent,
      Colors.white54,
      Colors.cyanAccent,
      Colors.black45,
      Colors.deepOrangeAccent
    ];
    List<Widget> pokemonItems = List<Widget>();
    _pokemonList.forEach((item) {
      var randomColorIndex = new Random().nextInt(colors.length);
      pokemonItems.add(
        PokemonCard(item.id, getPokemonImage(item.id), colors[randomColorIndex])
      );
    });
    return pokemonItems;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.count(
          controller: ScrollController(),
          crossAxisCount: 2,
          children: _generatePokemonItems()
        )
      )
    );
  }
}