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
        floatingActionButton: FloatingActionButton(
            child: Text("Pulsame")
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

  final _suggestions = <WordPair>[]; //Creamos una lista para almacenar las palabras creadas
  final Set<WordPair> _favoritas = Set<WordPair>(); //Creamos un conjunto para las palabras favoritas
  final _fontSize = const TextStyle(fontSize: 18.0); //Tamaño de la fuente

  //Devuelve el ListView
  
  Widget _buildSuggestions(){

    return ListView.builder(

      padding: const EdgeInsets.all(16.0),
        //Función Anónima que se llama una vez por elemento en _suggestions
        // Para cada fila , la funcion añade un ListTitle
        // Para las filas impares , la funcion añade un ListDivider

        //i: es un iterador que empieza en 0. Incrementa cada vez que se llama a la función
        //context: BuildContext
      itemBuilder: (context,i){

        if(i.isOdd) return Divider();

        final index = i ~/ 2;  //(División entera) Calcula el nº de elementos en el ListView menos
                                //El widget Divider

        if(_suggestions.length <= index) { //Si se ha llegado al final de los pares de palabras
          _suggestions.addAll(generateWordPairs().take(10)); //Se generan 10 más y se añaden a la lista
        }

        return _buildRow(_suggestions[index]);

      });


  }

  Widget _buildRow(WordPair pair){

    final bool yaGuardada =_favoritas.contains(pair); //Comprobamos si la palabra ya está en el conjunto

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _fontSize
      ),

      trailing: Icon(
        yaGuardada ? Icons.favorite : Icons.favorite_border,
        color: yaGuardada ? Colors.red : null,
      ),
      onTap: (){ //cuando se pulsa el ListTile , se llama a setState() para notificar
                //que el estado va a cambiar
        setState((){
          if(!yaGuardada)
            _favoritas.add(pair);
          else
            _favoritas.remove(pair);
        }

        );
    }

    );
  }

  void _pushGuardada(){

  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Generador de palabras aleatorias'),
        actions: <Widget>[ //Creamos un Array de Widgets con un solo elemento
          IconButton(icon: Icon(Icons.list),
              onPressed: _pushGuardada),
        ],
      ),
      body: _buildSuggestions()
    );
  }
}