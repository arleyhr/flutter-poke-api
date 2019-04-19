import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  String id;
  String image;
  Color color;
  ValueKey key;

  PokemonCard({@required this.id, @required this.image, @required this.color, this.key });

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
          onTap: () {
          },
          child: Container(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: color,
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(image),
                  ),
                ),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 30.0,
                    width: 40.0,
                    color: Colors.white,
                    child: Text('#$id'),
                    alignment: Alignment.center,
                  ),
                )
              ],
            )
          )
        ),
      );
  }
}