import 'package:flutter/material.dart';
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
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController(debugLabel: 'pokemonSc');

  @override
  void initState() {
    super.initState();
    _fetchPokemonList();

    _scrollController.addListener(() {
      if (!_isLoading && _scrollController.position.extentAfter == 0.0) {
        _fetchPokemonList();
      }
    });

  }
  _fetchPokemonList () async {
    setState(() {
      _isLoading = true;
    });
    final pokemonList = await pokeApi.getPokemonList(_pokemonList.size);
    setState(() {
      _pokemonList = _pokemonList.plus(pokemonList);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (ctx, index) {
                  var item = _pokemonList[index];

                  return PokemonCard(
                    id: item.id,
                    image: getPokemonImage(item.id),
                    color: item.color,
                    key: ValueKey(item.id),
                    onTap: () {
                      Navigator.pushNamed(context, '/detail', arguments: {
                        'id': item.id,
                        'name': item.name,
                        'image': getPokemonImage(item.id)
                      });
                    }
                  );
                },
                childCount: _pokemonList.size
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
              ),
            ),
            SliverToBoxAdapter(
              child: _isLoading ? Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: CircularProgressIndicator(),
              ) : SizedBox()
            )
          ],
        )
      )
    );
  }
}