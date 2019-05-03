import 'package:flutter/material.dart';
import 'dart:math';

final colors = [
  Colors.amber,Colors.blueAccent,Colors.greenAccent,Colors.redAccent,Colors.orangeAccent,Colors.black,Colors.lime,Colors.teal,Colors.lightGreen,Colors.purpleAccent,Colors.blue,Colors.amberAccent,Colors.yellowAccent,Colors.white54,Colors.cyanAccent,Colors.black45,Colors.deepOrangeAccent
];
class Pokemon {
  String name;
  String url;
  String id;
  Color color;

  Pokemon({this.name, this.url, this.color });

  Pokemon.fromJson(Map<String, dynamic> json) {
    final paths = json['url'].toString().split('/');
    var randomColorIndex = new Random().nextInt(colors.length);
    name = json['name'];
    url = json['url'];
    color = colors[randomColorIndex];
    id = paths[paths.length - 2].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['id'] = this.id;
    data['color'] = this.color;
    return data;
  }
}
