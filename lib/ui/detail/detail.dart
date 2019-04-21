import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  String id;
  String name;
  String image;
  Detail({this.id, this.name, this.image});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Container(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Hero(
            tag: 'pokemon-${widget.id}',
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(widget.image),
            )
          ),
        ),
      )
    );
  }
}