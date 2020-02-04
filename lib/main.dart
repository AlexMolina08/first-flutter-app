import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { //Heredar de SatelessWidget hace a la app un widget en si


  //Un widget está obligado a implementar el metodo build()

  //El metodo build() describe como mostrar el widget en base a otros widget
  //de nivel más bajo
  @override
  Widget build(BuildContext context){

    return MaterialApp(
      title: 'Bienvenido a Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bienvenido a Flutter')
        ),
        body: Center(
          child: PalabrasRandom(),
        ),
      ),
    );
  }
}


//Creamos el widget Stateful (con estado)
//Lo único que hace es crear una instancia de su estado
class PalabrasRandom extends StatefulWidget{

  @override
  PalabrasRandomState createState() => PalabrasRandomState();

}

//Creamos un estado para el StatefulWidget
//Hereda de la clase State especializada para el uso de PalabrasRandom(Buena práctica)
//Sostiene el funcionamiento del widget PalabrasRandom
//Devuelve una combinación de dos palabras
class PalabrasRandomState extends State<PalabrasRandom> {

  Widget build(BuildContext context){
    final dosPalabras = WordPair.random();
    return Text(dosPalabras.asPascalCase);
  }
}