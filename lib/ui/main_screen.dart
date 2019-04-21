import 'package:flutter/material.dart';
import 'package:pokedex/ui/home/home.dart';
import 'package:pokedex/ui/detail/detail.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      onGenerateRoute: (RouteSettings settings) {
        Map params = settings.arguments;
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (context) => Home());
            break;
          case '/detail':
            return MaterialPageRoute(builder: (context) => Detail(id: params['id'], name: params['name'], image: params['image']));
            break;
          default:
            return MaterialPageRoute(builder: (context) => Home());
        }
      }
    );
  }
}