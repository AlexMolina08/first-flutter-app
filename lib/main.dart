import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { //Heredar de SatelessWidget hace a la app un widget en si


  //Un widget está obligado a implementar el metodo build()

  //El metodo build() describe como mostrar el widget en base a otros widget
  //de nivel más bajo
  @override
  Widget build(BuildContext context){

    final dosPalabras = WordPair.random();

    return MaterialApp(
      title: 'Bienvenido a Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bienvenido a Flutter')
        ),
        body: Center(
          child: Text(dosPalabras.asPascalCase),
        ),
      ),
    );
  }



}