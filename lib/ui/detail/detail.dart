import 'package:flutter/material.dart';
import 'package:pokedex/logic/models/pokedetail.dart';
import 'package:pokedex/logic/pokeapi.dart';

class Detail extends StatefulWidget {
  String id;
  String name;
  String image;
  Detail({this.id, this.name, this.image});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  PokeDetail pokemonDetail;

  @override
  void initState() {
    super.initState();
    _getPokemonDetail();
  }

  _getPokemonDetail () async {
    final PokeDetail pokemonResult = await pokeApi.getPokemonDetail(widget.name);
    setState(() {
      pokemonDetail = pokemonResult;
    });
  }

  List<Widget> _buildPokemonProfile () {
    return [
      Text(pokemonDetail.name)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Card(
            child:  Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: 'pokemon-${widget.id}',
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.image),
                    ),
                  ),
                  if (pokemonDetail == null) CircularProgressIndicator(),
                  if (pokemonDetail != null) ..._buildPokemonProfile()
                ],
              ),
            )
          )
        ),
      )
    );
  }
}